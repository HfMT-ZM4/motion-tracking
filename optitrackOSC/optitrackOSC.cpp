

/*

	optitrackOSC

	OSC wrapper for Optitack data stream
	adapted from NatNetSDK/SampleClient.cpp


Usage [optional]:

	SampleClient [ServerIP] [LocalIP] [OutputFilename]

	[ServerIP]			IP address of the server (e.g. 192.168.0.107) ( defaults to local machine)
	[OutputFilename]	Name of points file (pts) to write out.  defaults to Client-output.pts

*/

// includes

#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

#ifdef _WIN32
#   include <conio.h>
#else
#   include <unistd.h>
#   include <termios.h>
#endif

#include <vector>
#include <string>
#include <unordered_map>
#include <chrono>

#include <NatNetTypes.h>
#include <NatNetCAPI.h>
#include <NatNetClient.h>
#include "NatUtils_hfmt.h"

#include "OSCMap.hpp"

//#include "Osc99.h"

#include <winsock2.h>
#pragma warning(disable:4996) 
#pragma comment(lib,"ws2_32.lib") //Winsock Library


// send to defs

char sendToIP[16] = "127.0.0.1";	// address to send to
int sendToPort = 8888;

// prototypes

void NATNET_CALLCONV ServerDiscoveredCallback(const sNatNetDiscoveredServer* pDiscoveredServer, void* pUserContext);
void NATNET_CALLCONV DataHandler(sFrameOfMocapData* data, void* pUserData);    // receives data from the server
void NATNET_CALLCONV MessageHandler(Verbosity msgType, const char* msg);      // receives NatNet error messages
void resetClient();
int ConnectClient();
bool sendOSC( const OSCMap & bndl);
void setupSocket();
void ConvertRHSPosZupToYUp(float& x, float& y, float& z);
void ConvertRHSRotZUpToYUp(float& qx, float& qy, float& qz, float& qw);

// globals

NatNetClient* g_pClient = NULL;
struct sockaddr_in g_sendToAddr;
int g_socket;
static const ConnectionType kDefaultConnectionType = ConnectionType_Multicast;
std::vector< sNatNetDiscoveredServer > g_discoveredServers;
sNatNetClientConnectParams g_connectParams;
char g_discoveredMulticastGroupAddr[kNatNetIpv4AddrStrLenMax] = NATNET_DEFAULT_MULTICAST_ADDRESS;
int g_analogSamplesPerMocapFrame = 0;
sServerDescription g_serverDescription;

#ifndef M_PI
#define M_PI 3.14159265358979323846264338327950288
#endif

std::unordered_map<int, std::string> g_markerNames;

/**
* key: type_number, eg. rg_1, skrg_1
*/
std::unordered_map<std::string, std::string> g_rigidBodyNames;
std::string skel_rb_prefix = "srb_";
std::string rb_prefix = "rb_";

typedef std::chrono::high_resolution_clock chrono_clock;
typedef std::chrono::duration<float, std::milli> duration_t;

// modelID_markerID : duration of marker
std::unordered_map<std::string, std::chrono::steady_clock::time_point > g_model_marker_id_frames;
std::unordered_map<std::string, std::vector<double> > g_prev_marker_xyz;


// Used for converting NatNet data to the proper units.
float g_unitConversion = 1.0f;

// World Up Axis (default to Y)
int g_upAxis = 1; // 

double radtodeg = 180.0 / M_PI;

int eulOrder = EulOrdXYZr;

// --


int main(int argc, char* argv[])
{

	if (argc == 3)
	{
		strncpy(sendToIP, argv[1], 16);
		sendToPort = std::stoi(argv[2]);
		printf("setting up to stream motive OSC to %s on port %i\n", sendToIP, sendToPort);

	}

	// print version info
	unsigned char ver[4];
	NatNet_GetVersion(ver);
	printf("NatNet Sample Client (NatNet ver. %d.%d.%d.%d)\n", ver[0], ver[1], ver[2], ver[3]);

	// to do: add IP address settable from command prompt
	setupSocket();

	// Install logging callback
	NatNet_SetLogCallback(MessageHandler);

	// create NatNet client
	g_pClient = new NatNetClient();

	// set the frame callback handler
	g_pClient->SetFrameReceivedCallback(DataHandler, g_pClient);	// this function will receive data from the server

	// for now only using one server, if someday we use multiple servers, see the SimpleClient server discovery routine

	g_connectParams.connectionType = kDefaultConnectionType;
	g_connectParams.serverAddress = "127.0.0.1";
	g_connectParams.localAddress = "127.0.0.1";

	int iResult;

	// Connect to Motive
	iResult = ConnectClient();
	if (iResult != ErrorCode_OK)
	{
		printf("Error initializing client.  See log for details.  Exiting");
		return 1;
	}
	else
	{
		printf("Client initialized and ready.\n");
	}


	// Send/receive test request
	void* response;
	int nBytes;
	printf("[SampleClient] Sending Test Request\n");
	iResult = g_pClient->SendMessageAndWait("TestRequest", &response, &nBytes);
	if (iResult == ErrorCode_OK)
	{
		printf("[SampleClient] Received: %s", (char*)response);
	}

	// Retrieve Data Descriptions from Motive
	printf("\n\n[SampleClient] Requesting Data Descriptions...");
	sDataDescriptions* pDataDefs = NULL;
	iResult = g_pClient->GetDataDescriptionList(&pDataDefs);

	if (iResult != ErrorCode_OK || pDataDefs == NULL)
	{
		printf("[SampleClient] Unable to retrieve Data Descriptions.");
	}
	else
	{
		/*
		OscBundle bndl;
		OscMessage m_x, m_y, m_z, m_id, m_name;
		OscMessageInitialise(&m_name, "/dataDescription/rigidBody/name");
		OscMessageInitialise(&m_id, "/dataDescription/rigidBody/id");
		OscMessageInitialise(&m_x, "/dataDescription/rigidBody/x");
		OscMessageInitialise(&m_y, "/dataDescription/rigidBody/y");
		OscMessageInitialise(&m_y, "/dataDescription/rigidBody/z");
		*/
		printf("[SampleClient] Received %d Data Descriptions:\n", pDataDefs->nDataDescriptions);
		for (int i = 0; i < pDataDefs->nDataDescriptions; i++)
		{
			printf("Data Description # %d (type=%d)\n", i, pDataDefs->arrDataDescriptions[i].type);
			if (pDataDefs->arrDataDescriptions[i].type == Descriptor_MarkerSet)
			{
				// MarkerSet
				sMarkerSetDescription* pMS = pDataDefs->arrDataDescriptions[i].Data.MarkerSetDescription;
				printf("MarkerSet Name : %s\n", pMS->szName);
				for (int i = 0; i < pMS->nMarkers; i++) {
					printf("%s\n", pMS->szMarkerNames[i]);
				}
			}
			else if (pDataDefs->arrDataDescriptions[i].type == Descriptor_RigidBody)
			{
				// RigidBody
				sRigidBodyDescription* pRB = pDataDefs->arrDataDescriptions[i].Data.RigidBodyDescription;
				printf("RigidBody Name : %s\n", pRB->szName);
				printf("RigidBody ID : %d\n", pRB->ID);
				printf("RigidBody Parent ID : %d\n", pRB->parentID);
				printf("Parent Offset : %3.2f,%3.2f,%3.2f\n", pRB->offsetx, pRB->offsety, pRB->offsetz);

				g_rigidBodyNames[rb_prefix + std::to_string(pRB->ID)] = pRB->szName;

				if (pRB->MarkerPositions != NULL && pRB->MarkerRequiredLabels != NULL)
				{
					for (int markerIdx = 0; markerIdx < pRB->nMarkers; ++markerIdx)
					{
						const MarkerData& markerPosition = pRB->MarkerPositions[markerIdx];
						const int markerRequiredLabel = pRB->MarkerRequiredLabels[markerIdx];

						printf("\tMarker #%d:\n", markerIdx);
						printf("\t\tPosition: %.2f, %.2f, %.2f\n", markerPosition[0], markerPosition[1], markerPosition[2]);

						if (markerRequiredLabel != 0)
						{
							printf("\t\tRequired active label: %d\n", markerRequiredLabel);
						}
					}
				}
			}
			else if (pDataDefs->arrDataDescriptions[i].type == Descriptor_Skeleton)
			{
				// Skeleton
				sSkeletonDescription* pSK = pDataDefs->arrDataDescriptions[i].Data.SkeletonDescription;
				printf("Skeleton Name : %s\n", pSK->szName);
				printf("Skeleton ID : %d\n", pSK->skeletonID);
				printf("RigidBody (Bone) Count : %d\n", pSK->nRigidBodies);
				for (int j = 0; j < pSK->nRigidBodies; j++)
				{
					sRigidBodyDescription* pRB = &pSK->RigidBodies[j];
					printf("  RigidBody Name : %s\n", pRB->szName);
					printf("  RigidBody ID : %d\n", pRB->ID);
					printf("  RigidBody Parent ID : %d\n", pRB->parentID);
					printf("  Parent Offset : %3.2f,%3.2f,%3.2f\n", pRB->offsetx, pRB->offsety, pRB->offsetz);
					g_rigidBodyNames[ skel_rb_prefix + std::to_string(pRB->ID)] = pRB->szName;

				}
			}
			else if (pDataDefs->arrDataDescriptions[i].type == Descriptor_ForcePlate)
			{
				// Force Plate
				sForcePlateDescription* pFP = pDataDefs->arrDataDescriptions[i].Data.ForcePlateDescription;
				printf("Force Plate ID : %d\n", pFP->ID);
				printf("Force Plate Serial : %s\n", pFP->strSerialNo);
				printf("Force Plate Width : %3.2f\n", pFP->fWidth);
				printf("Force Plate Length : %3.2f\n", pFP->fLength);
				printf("Force Plate Electrical Center Offset (%3.3f, %3.3f, %3.3f)\n", pFP->fOriginX, pFP->fOriginY, pFP->fOriginZ);
				for (int iCorner = 0; iCorner < 4; iCorner++)
					printf("Force Plate Corner %d : (%3.4f, %3.4f, %3.4f)\n", iCorner, pFP->fCorners[iCorner][0], pFP->fCorners[iCorner][1], pFP->fCorners[iCorner][2]);
				printf("Force Plate Type : %d\n", pFP->iPlateType);
				printf("Force Plate Data Type : %d\n", pFP->iChannelDataType);
				printf("Force Plate Channel Count : %d\n", pFP->nChannels);
				for (int iChannel = 0; iChannel < pFP->nChannels; iChannel++)
					printf("\tChannel %d : %s\n", iChannel, pFP->szChannelNames[iChannel]);
			}
			else if (pDataDefs->arrDataDescriptions[i].type == Descriptor_Device)
			{
				// Peripheral Device
				sDeviceDescription* pDevice = pDataDefs->arrDataDescriptions[i].Data.DeviceDescription;
				printf("Device Name : %s\n", pDevice->strName);
				printf("Device Serial : %s\n", pDevice->strSerialNo);
				printf("Device ID : %d\n", pDevice->ID);
				printf("Device Channel Count : %d\n", pDevice->nChannels);
				for (int iChannel = 0; iChannel < pDevice->nChannels; iChannel++)
					printf("\tChannel %d : %s\n", iChannel, pDevice->szChannelNames[iChannel]);
			}
			else
			{
				printf("Unknown data type.");
				// Unknown
			}
		}
	}



	if (pDataDefs)
	{
		NatNet_FreeDescriptions(pDataDefs);
		pDataDefs = NULL;
	}


	// Ready to receive marker stream!
	printf("\nClient is connected to server and listening for data...\n");
	int c;
	bool bExit = false;
	while (c = _getch())
	{
		switch (c)
		{
		case 'q':
			bExit = true;
			break;
		case 'r':
			resetClient();
			break;
		case 'p':
			sServerDescription ServerDescription;
			memset(&ServerDescription, 0, sizeof(ServerDescription));
			g_pClient->GetServerDescription(&ServerDescription);
			if (!ServerDescription.HostPresent)
			{
				printf("Unable to connect to server. Host not present. Exiting.");
				return 1;
			}
			break;
		case 's':
		{
			printf("\n\n[SampleClient] Requesting Data Descriptions...");
			sDataDescriptions* pDataDefs = NULL;
			iResult = g_pClient->GetDataDescriptionList(&pDataDefs);
			if (iResult != ErrorCode_OK || pDataDefs == NULL)
			{
				printf("[SampleClient] Unable to retrieve Data Descriptions.");
			}
			else
			{
				printf("[SampleClient] Received %d Data Descriptions:\n", pDataDefs->nDataDescriptions);
			}
		}
		break;
		case 'm':	                        // change to multicast
			g_connectParams.connectionType = ConnectionType_Multicast;
			iResult = ConnectClient();
			if (iResult == ErrorCode_OK)
				printf("Client connection type changed to Multicast.\n\n");
			else
				printf("Error changing client connection type to Multicast.\n\n");
			break;
		case 'u':	                        // change to unicast
			g_connectParams.connectionType = ConnectionType_Unicast;
			iResult = ConnectClient();
			if (iResult == ErrorCode_OK)
				printf("Client connection type changed to Unicast.\n\n");
			else
				printf("Error changing client connection type to Unicast.\n\n");
			break;
		case 'c':                          // connect
			iResult = ConnectClient();
			break;
		case 'd':                          // disconnect
			// note: applies to unicast connections only - indicates to Motive to stop sending packets to that client endpoint
			iResult = g_pClient->SendMessageAndWait("Disconnect", &response, &nBytes);
			if (iResult == ErrorCode_OK)
				printf("[SampleClient] Disconnected");
			break;
		default:
			break;
		}
		if (bExit)
			break;
	}

	// Done - clean up.
	if (g_pClient)
	{
		g_pClient->Disconnect();
		delete g_pClient;
		g_pClient = NULL;
	}


	closesocket(g_socket);
	WSACleanup();

	return ErrorCode_OK;
}


void NATNET_CALLCONV ServerDiscoveredCallback(const sNatNetDiscoveredServer* pDiscoveredServer, void* pUserContext)
{
	char serverHotkey = '.';
	if (g_discoveredServers.size() < 9)
	{
		serverHotkey = static_cast<char>('1' + g_discoveredServers.size());
	}

	const char* warning = "";

	if (pDiscoveredServer->serverDescription.bConnectionInfoValid == false)
	{
		warning = " (WARNING: Legacy server, could not autodetect settings. Auto-connect may not work reliably.)";
	}

	printf("[%c] %s %d.%d at %s%s\n",
		serverHotkey,
		pDiscoveredServer->serverDescription.szHostApp,
		pDiscoveredServer->serverDescription.HostAppVersion[0],
		pDiscoveredServer->serverDescription.HostAppVersion[1],
		pDiscoveredServer->serverAddress,
		warning);

	g_discoveredServers.push_back(*pDiscoveredServer);
}

// Establish a NatNet Client connection
int ConnectClient()
{
	// Release previous server
	g_pClient->Disconnect();

	// Init Client and connect to NatNet server
	int retCode = g_pClient->Connect(g_connectParams);
	if (retCode != ErrorCode_OK)
	{
		printf("Unable to connect to server.  Error code: %d. Exiting", retCode);
		return ErrorCode_Internal;
	}
	else
	{
		// connection succeeded

		void* pResult;
		int nBytes = 0;
		ErrorCode ret = ErrorCode_OK;

		// print server info
		memset(&g_serverDescription, 0, sizeof(g_serverDescription));
		ret = g_pClient->GetServerDescription(&g_serverDescription);
		if (ret != ErrorCode_OK || !g_serverDescription.HostPresent)
		{
			printf("Unable to connect to server. Host not present. Exiting.");
			return 1;
		}
		printf("\n[SampleClient] Server application info:\n");
		printf("Application: %s (ver. %d.%d.%d.%d)\n", g_serverDescription.szHostApp, g_serverDescription.HostAppVersion[0],
			g_serverDescription.HostAppVersion[1], g_serverDescription.HostAppVersion[2], g_serverDescription.HostAppVersion[3]);
		printf("NatNet Version: %d.%d.%d.%d\n", g_serverDescription.NatNetVersion[0], g_serverDescription.NatNetVersion[1],
			g_serverDescription.NatNetVersion[2], g_serverDescription.NatNetVersion[3]);
		printf("Client IP:%s\n", g_connectParams.localAddress);
		printf("Server IP:%s\n", g_connectParams.serverAddress);
		printf("Server Name:%s\n", g_serverDescription.szHostComputerName);

		// get mocap frame rate
		ret = g_pClient->SendMessageAndWait("FrameRate", &pResult, &nBytes);
		if (ret == ErrorCode_OK)
		{
			float fRate = *((float*)pResult);
			printf("Mocap Framerate : %3.2f\n", fRate);
		}
		else
			printf("Error getting frame rate.\n");

		// get # of analog samples per mocap frame of data
		ret = g_pClient->SendMessageAndWait("AnalogSamplesPerMocapFrame", &pResult, &nBytes);
		if (ret == ErrorCode_OK)
		{
			g_analogSamplesPerMocapFrame = *((int*)pResult);
			printf("Analog Samples Per Mocap Frame : %d\n", g_analogSamplesPerMocapFrame);
		}
		else
			printf("Error getting Analog frame rate.\n");


		// example of NatNet general message passing. Set units to millimeters
	// and get the multiplicative conversion factor in the response.

		ret = g_pClient->SendMessageAndWait("UnitsToMillimeters", &pResult, &nBytes);
		if (ret == ErrorCode_OK)
		{
			g_unitConversion = *(float*)pResult;
		}

		ret = g_pClient->SendMessageAndWait("UpAxis", &pResult, &nBytes);
		if (ret == ErrorCode_OK)
		{
			g_upAxis = *(long*)pResult;
			printf("------------ UP AXIS: %i ---------\n", g_upAxis);
		}
	}

	return ErrorCode_OK;
}



// DataHandler receives data from the server
// This function is called by NatNet when a frame of mocap data is available
void NATNET_CALLCONV DataHandler(sFrameOfMocapData* data, void* pUserData)
{
	NatNetClient* pClient = (NatNetClient*)pUserData;

	// Software latency here is defined as the span of time between:
	//   a) The reception of a complete group of 2D frames from the camera system (CameraDataReceivedTimestamp)
	// and
	//   b) The time immediately prior to the NatNet frame being transmitted over the network (TransmitTimestamp)
	//
	// This figure may appear slightly higher than the "software latency" reported in the Motive user interface,
	// because it additionally includes the time spent preparing to stream the data via NatNet.
	const uint64_t softwareLatencyHostTicks = data->TransmitTimestamp - data->CameraDataReceivedTimestamp;
	const double softwareLatencyMillisec = (softwareLatencyHostTicks * 1000) / static_cast<double>(g_serverDescription.HighResClockFrequency);

	// Transit latency is defined as the span of time between Motive transmitting the frame of data, and its reception by the client (now).
	// The SecondsSinceHostTimestamp method relies on NatNetClient's internal clock synchronization with the server using Cristian's algorithm.
	const double transitLatencyMillisec = pClient->SecondsSinceHostTimestamp(data->TransmitTimestamp) * 1000.0;

	int i = 0;

	OSCMap o_bundle;

	//OscBundle* bndl = (OscBundle *)malloc(MAX_OSC_BUNDLE_SIZE);
	//OscBundleInitialise(bndl, oscTimeTagZero);

	//OscMessage msg;
	/*
	printf("FrameID : %d\n", data->iFrame);
	printf("Timestamp : %3.2lf\n", data->fTimestamp);
	printf("Software latency : %.2lf milliseconds\n", softwareLatencyMillisec);
	*/

	o_bundle.addMessage("/frameID", data->iFrame);
	o_bundle.addMessage("/timestamp", data->fTimestamp);
	o_bundle.addMessage("/latency/software", softwareLatencyMillisec);


	// Only recent versions of the Motive software in combination with ethernet camera systems support system latency measurement.
	// If it's unavailable (for example, with USB camera systems, or during playback), this field will be zero.
	const bool bSystemLatencyAvailable = data->CameraMidExposureTimestamp != 0;

	if (bSystemLatencyAvailable)
	{
		// System latency here is defined as the span of time between:
		//   a) The midpoint of the camera exposure window, and therefore the average age of the photons (CameraMidExposureTimestamp)
		// and
		//   b) The time immediately prior to the NatNet frame being transmitted over the network (TransmitTimestamp)
		const uint64_t systemLatencyHostTicks = data->TransmitTimestamp - data->CameraMidExposureTimestamp;
		const double systemLatencyMillisec = (systemLatencyHostTicks * 1000) / static_cast<double>(g_serverDescription.HighResClockFrequency);

		// Client latency is defined as the sum of system latency and the transit time taken to relay the data to the NatNet client.
		// This is the all-inclusive measurement (photons to client processing).
		const double clientLatencyMillisec = pClient->SecondsSinceHostTimestamp(data->CameraMidExposureTimestamp) * 1000.0;

		// You could equivalently do the following (not accounting for time elapsed since we calculated transit latency above):
		//const double clientLatencyMillisec = systemLatencyMillisec + transitLatencyMillisec;

		o_bundle.addMessage("/latency/system", systemLatencyMillisec);
		o_bundle.addMessage("/latency/client", clientLatencyMillisec);
		o_bundle.addMessage("/latency/transit", transitLatencyMillisec);

		/*
		printf("System latency : %.2lf milliseconds\n", systemLatencyMillisec);
		printf("Total client latency : %.2lf milliseconds (transit time +%.2lf ms)\n", clientLatencyMillisec, transitLatencyMillisec);
		*/
	}
	else
	{
		o_bundle.addMessage("/latency/transit", transitLatencyMillisec);

		//printf("Transit latency : %.2lf milliseconds\n", transitLatencyMillisec);
	}

	// FrameOfMocapData params
	bool bIsRecording = ((data->params & 0x01) != 0);
	o_bundle.addMessage("/isRecording", bIsRecording);


	bool bTrackedModelsChanged = ((data->params & 0x02) != 0);
	o_bundle.addMessage("/modelChanged", bTrackedModelsChanged);


	// timecode - for systems with an eSync and SMPTE timecode generator - decode to values
	int hour, minute, second, frame, subframe;
	NatNet_DecodeTimecode(data->Timecode, data->TimecodeSubframe, &hour, &minute, &second, &frame, &subframe);
	// decode to friendly string
	char szTimecode[128] = "";
	NatNet_TimecodeStringify(data->Timecode, data->TimecodeSubframe, szTimecode, 128);
	//printf("Timecode : %s\n", szTimecode);

	o_bundle.addMessage("/timecode", szTimecode);


	// Rigid Bodies
	//printf("Rigid Bodies [Count=%d]\n", data->nRigidBodies);
	//OscMessageInitialise(&msg, "/rigidBody/count");
	//OscMessageAddInt32(&msg, data->nRigidBodies);
	//OscBundleAddContents(bndl, &msg);

	o_bundle.addMessage("/rigidBody/x");
	o_bundle.addMessage("/rigidBody/y");
	o_bundle.addMessage("/rigidBody/z");
	o_bundle.addMessage("/rigidBody/qx");
	o_bundle.addMessage("/rigidBody/qy");
	o_bundle.addMessage("/rigidBody/qz");
	o_bundle.addMessage("/rigidBody/qw");
	o_bundle.addMessage("/rigidBody/yaw");
	o_bundle.addMessage("/rigidBody/pitch");
	o_bundle.addMessage("/rigidBody/roll");
	o_bundle.addMessage("/rigidBody/id");
	o_bundle.addMessage("/rigidBody/name");
	o_bundle.addMessage("/rigidBody/validTracking");
	o_bundle.addMessage("/rigidBody/meanError");

	
	std::string str_addr;
	EulerAngles ea;

	for (i = 0; i < data->nRigidBodies; i++)
	{
		sRigidBodyData& _rb = data->RigidBodies[i];

		/*
		if (g_upAxis == 2)
		{
			// convert position
			ConvertRHSPosZupToYUp(_rb.x, _rb.y, _rb.z);
			// convert orientation
			ConvertRHSRotZUpToYUp(_rb.qx, _rb.qy, _rb.qz, _rb.qw);
		}
		*/
		o_bundle["/rigidBody/x"].appendValue(_rb.x * g_unitConversion);
		o_bundle["/rigidBody/y"].appendValue(_rb.y * g_unitConversion);
		o_bundle["/rigidBody/z"].appendValue(_rb.z * g_unitConversion);

		o_bundle["/rigidBody/qx"].appendValue(_rb.qx);
		o_bundle["/rigidBody/qy"].appendValue(_rb.qy);
		o_bundle["/rigidBody/qz"].appendValue(_rb.qz);
		o_bundle["/rigidBody/qw"].appendValue(_rb.qw);


		/*
		ea = Eul_FromQuat(Quat({ _rb.qx, _rb.qy, _rb.qz, _rb.qw }), eulOrder);

		ea.x = NATUtils::RadiansToDegrees(ea.x);
		ea.y = NATUtils::RadiansToDegrees(ea.y);
		ea.z = NATUtils::RadiansToDegrees(ea.z);
	
		OscMessageAddFloat32(&m_pitch, ea.x);
		OscMessageAddFloat32(&m_yaw, ea.y);
		OscMessageAddFloat32(&m_roll, ea.z);
		*/
		
		// flety version
		float q1 = _rb.qw;
		float q2 = _rb.qx;
		float q3 = _rb.qy;
		float q4 = _rb.qz;

		float yaw2 = atan2(2.0f * (q2 * q3 + q1 * q4), q1 * q1 + q2 * q2 - q3 * q3 - q4 * q4);
		float pitch2 = -asin(2.0f * ((q2 * q4) - (q1 * q3)));
		float roll2 = atan2(2.0f * (q1 * q2 + q3 * q4), (q1 * q1) - (q2 * q2) - (q3 * q3) + (q4 * q4));

		/*
		// roll (x-axis rotation)
		float sinr_cosp = 2.0f * (_rb.qw * _rb.qx + _rb.qy * _rb.qz);
		float cosr_cosp = 1.0f - 2.0f * (_rb.qx * _rb.qx + _rb.qy * _rb.qy);
		float roll = atan2(sinr_cosp, cosr_cosp);

		// pitch (y-axis rotation)
		float sinp = 2.0f * (_rb.qw * _rb.qy - _rb.qz * _rb.qx);
		float pitch;
		if (fabs(sinp) >= 1)
			pitch = copysign(M_PI / 2, sinp); // use 90 degrees if out of range
		else
			pitch = -asin(sinp);


		// yaw (z-axis rotation)
		float siny_cosp = 2.0f * (_rb.qw * _rb.qz + _rb.qx * _rb.qy);
		float cosy_cosp = 1.0f - 2.0f * (_rb.qy * _rb.qy + _rb.qz * _rb.qz);
		float yaw = atan2(siny_cosp, cosy_cosp);
		*/

		o_bundle["/rigidBody/yaw"].appendValue(yaw2 * radtodeg);
		o_bundle["/rigidBody/pitch"].appendValue(pitch2 * radtodeg);
		o_bundle["/rigidBody/roll"].appendValue(roll2 * radtodeg);

		o_bundle["/rigidBody/id"].appendValue(_rb.ID);
		o_bundle["/rigidBody/name"].appendValue(g_rigidBodyNames[rb_prefix + std::to_string(_rb.ID)].c_str());
		o_bundle["/rigidBody/meanError"].appendValue(_rb.MeanError);


		// params
		// 0x01 : bool, rigid body was successfully tracked in this frame
		bool bTrackingValid = _rb.params & 0x01;
		o_bundle["/rigidBody/validTracking"].appendValue(bTrackingValid);


		/*
		printf("Rigid Body [ID=%d  Error=%3.2f  Valid=%d]\n", data->RigidBodies[i].ID, data->RigidBodies[i].MeanError, bTrackingValid);
		printf("\tx\ty\tz\tqx\tqy\tqz\tqw\n");
		printf("\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\n",
			data->RigidBodies[i].x,
			data->RigidBodies[i].y,
			data->RigidBodies[i].z,
			data->RigidBodies[i].qx,
			data->RigidBodies[i].qy,
			data->RigidBodies[i].qz,
			data->RigidBodies[i].qw);
		*/
	}


	// Skeletons
	
	o_bundle.addMessage("/skeleton/count", data->nSkeletons);

	for (i = 0; i < data->nSkeletons; i++)
	{
		
		//OscMessage m_skel_x, m_skel_y, m_skel_z, m_skel_qx, m_skel_qy, m_skel_qz, m_skel_qw, m_skel_roll, m_skel_pitch, m_skel_yaw, m_skel_id, m_skel_valid, m_skel_meanError, m_skel_name;
		OSCMap skel_bundle;

		skel_bundle.addMessage("/x");
		skel_bundle.addMessage("/y");
		skel_bundle.addMessage("/z");
		skel_bundle.addMessage("/qx");
		skel_bundle.addMessage("/qy");
		skel_bundle.addMessage("/qz");
		skel_bundle.addMessage("/qw");
		skel_bundle.addMessage("/yaw");
		skel_bundle.addMessage("/pitch");
		skel_bundle.addMessage("/roll");
		skel_bundle.addMessage("/id");
		skel_bundle.addMessage("/name");
		skel_bundle.addMessage("/validTracking");
		skel_bundle.addMessage("/id");
		skel_bundle.addMessage("/meanError");


		sSkeletonData skData = data->Skeletons[i];
	//	printf("Skeleton [ID=%d  Bone count=%d]\n", skData.skeletonID, skData.nRigidBodies);
		for (int j = 0; j < skData.nRigidBodies; j++)
		{
			sRigidBodyData _rb = skData.RigidBodyData[j];

			skel_bundle["/x"].appendValue(_rb.x* g_unitConversion);
			skel_bundle["/y"].appendValue(_rb.y* g_unitConversion);
			skel_bundle["/z"].appendValue(_rb.z* g_unitConversion);
			skel_bundle["/qx"].appendValue(_rb.qx);
			skel_bundle["/qy"].appendValue(_rb.qy);
			skel_bundle["/qz"].appendValue(_rb.qz);
			skel_bundle["/qw"].appendValue(_rb.qw);

			// flety version
			float q1 = _rb.qw;
			float q2 = _rb.qx;
			float q3 = _rb.qy;
			float q4 = _rb.qz;

			float yaw2 = atan2(2.0f * (q2 * q3 + q1 * q4), q1 * q1 + q2 * q2 - q3 * q3 - q4 * q4);
			float pitch2 = -asin(2.0f * ((q2 * q4) - (q1 * q3)));
			float roll2 = atan2(2.0f * (q1 * q2 + q3 * q4), (q1 * q1) - (q2 * q2) - (q3 * q3) + (q4 * q4));

			skel_bundle["/roll"].appendValue(roll2* radtodeg);
			skel_bundle["/pitch"].appendValue(pitch2* radtodeg);
			skel_bundle["/yaw"].appendValue(yaw2* radtodeg);

			skel_bundle["/id"].appendValue(_rb.ID);
			skel_bundle["/name"].appendValue(g_rigidBodyNames[ skel_rb_prefix + std::to_string(_rb.ID) ].c_str());

			skel_bundle["/meanError"].appendValue(_rb.MeanError);

			// params
			// 0x01 : bool, rigid body was successfully tracked in this frame
			bool bTrackingValid = _rb.params & 0x01;
			skel_bundle["/validTracking"].appendValue(bTrackingValid);
			//int modelID, markerID;

			//NatNet_DecodeID(rbData.ID, &modelID, &markerID);
			//std::string model_marker_id = std::to_string(modelID) + "_" + std::to_string(markerID);
		
			//printf("Marker ID %d\t%s\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\n",
				//rbData.ID, g_rigidBodyNames[skel_rb_prefix + std::to_string(rbData.ID)].c_str(), rbData.x, rbData.y, rbData.z, rbData.qx, rbData.qy, rbData.qz, rbData.qw);

		}

		o_bundle.addMessage(std::string("/skel/") + std::to_string(i + 1), skel_bundle);

	}

	
	// labeled markers - this includes all markers (Active, Passive, and 'unlabeled' (markers with no asset but a PointCloud ID)
	bool bOccluded;     // marker was not visible (occluded) in this frame
	bool bPCSolved;     // reported position provided by point cloud solve
	bool bModelSolved;  // reported position provided by model solve
	bool bHasModel;     // marker has an associated asset in the data stream
	bool bUnlabeled;    // marker is 'unlabeled', but has a point cloud ID that matches Motive PointCloud ID (In Motive 3D View)
	bool bActiveMarker; // marker is an actively labeled LED marker

	//printf("Markers [Count=%d] Unlabeled [Count=%d]\n", data->nLabeledMarkers, data->nOtherMarkers);
	//OscMessageInitialise(&msg, "/marker/count");
	//OscMessageAddInt32(&msg, data->nLabeledMarkers);
	//OscBundleAddContents(bndl, &msg);

	//OscMessage m_active, m_labeled, m_occ, m_pc, m_model, m_modID, m_marID, m_size, m_duration, m_dx, m_dy, m_dz, m_moved_dist;
	o_bundle.addMessage("/marker/x");
	o_bundle.addMessage("/marker/y");
	o_bundle.addMessage("/marker/z");

	o_bundle.addMessage("/marker/dx");
	o_bundle.addMessage("/marker/dy");
	o_bundle.addMessage("/marker/dz");

	o_bundle.addMessage("/marker/moved/dist");

	o_bundle.addMessage("/marker/labeled");
	o_bundle.addMessage("/marker/active");
	o_bundle.addMessage("/marker/occulded");
	o_bundle.addMessage("/marker/solved/pc");
	o_bundle.addMessage("/marker/solved/model");

	o_bundle.addMessage("/marker/modelID");
	o_bundle.addMessage("/marker/markerID");
	o_bundle.addMessage("/marker/size");

	o_bundle.addMessage("/marker/dur");


	auto prev = g_model_marker_id_frames;
	auto prev_xyz = g_prev_marker_xyz;

	for (i = 0; i < data->nLabeledMarkers; i++)
	{
		sMarker marker = data->LabeledMarkers[i];

		double x, y, z;
		x = marker.x * g_unitConversion;
		y = marker.y * g_unitConversion;
		z = marker.z * g_unitConversion;

		o_bundle["/marker/x"].appendValue(x);
		o_bundle["/marker/y"].appendValue(y);
		o_bundle["/marker/z"].appendValue(z);


		bOccluded = ((marker.params & 0x01) != 0);
		bPCSolved = ((marker.params & 0x02) != 0);
		bModelSolved = ((marker.params & 0x04) != 0);
		bHasModel = ((marker.params & 0x08) != 0);
		bUnlabeled = ((marker.params & 0x10) != 0);
		bActiveMarker = ((marker.params & 0x20) != 0);

		int modelID, markerID;

		NatNet_DecodeID(marker.ID, &modelID, &markerID);
		//printf("%i %i\n", i, markerID);
		std::string model_marker_id = std::to_string(modelID) + "_" + std::to_string(markerID);

		if (g_model_marker_id_frames.count(model_marker_id) == 0)
		{
			g_model_marker_id_frames[model_marker_id] = chrono_clock::now();

			o_bundle["/marker/dur"].appendValue(0);
			o_bundle["/marker/dx"].appendValue(0);
			o_bundle["/marker/dy"].appendValue(0);
			o_bundle["/marker/dz"].appendValue(0);
			o_bundle["/marker/moved/dist"].appendValue(0);

			g_prev_marker_xyz[model_marker_id] = { x,y,z };
		}
		else
		{
			duration_t dur = chrono_clock::now() - g_model_marker_id_frames[model_marker_id];
		//	OscMessageAddFloat32(&m_duration, dur.count() * 0.001 );

			double dx = x - g_prev_marker_xyz[model_marker_id][0];
			double dy = y - g_prev_marker_xyz[model_marker_id][1];
			double dz = z - g_prev_marker_xyz[model_marker_id][2];

			o_bundle["/marker/dur"].appendValue(dur.count() * 0.001);
			o_bundle["/marker/dx"].appendValue(dx);
			o_bundle["/marker/dy"].appendValue(dy);
			o_bundle["/marker/dz"].appendValue(dz);
			o_bundle["/marker/moved/dist"].appendValue(sqrt(dx * dx + dy * dy + dz * dz));


			g_prev_marker_xyz[model_marker_id] = { x,y,z };

			prev.erase(model_marker_id);
			prev_xyz.erase(model_marker_id);
		}

		/*
		OscMessageAddBool(&m_active, bActiveMarker);
		OscMessageAddBool(&m_labeled , !bUnlabeled);
		OscMessageAddBool(&m_occ, bOccluded);
		OscMessageAddBool(&m_pc, bPCSolved);
		OscMessageAddBool(&m_model, bModelSolved);
		OscMessageAddInt32(&m_modID, modelID);
		OscMessageAddInt32(&m_marID, markerID);
		OscMessageAddFloat32(&m_size, marker.size);
		*/

		o_bundle["/marker/labeled"].appendValue(!bUnlabeled);
		o_bundle["/marker/active"].appendValue(bActiveMarker);
		o_bundle["/marker/occulded"].appendValue(bOccluded);
		o_bundle["/marker/solved/pc"].appendValue(bPCSolved);
		o_bundle["/marker/solved/model"].appendValue(bModelSolved);

		o_bundle["/marker/modelID"].appendValue(modelID);
		o_bundle["/marker/markerID"].appendValue(markerID);
		o_bundle["/marker/size"].appendValue(marker.size);


		/*
		printf("%s Marker [ModelID=%d, MarkerID=%d, Occluded=%d, PCSolved=%d, ModelSolved=%d] [size=%3.2f] [pos=%3.2f,%3.2f,%3.2f]\n",
			szMarkerType, modelID, markerID, bOccluded, bPCSolved, bModelSolved, marker.size, marker.x, marker.y, marker.z);
		*/
	}

	// remove markers that were not updated from previous frame
	for (const auto& p : prev)
	{
		g_model_marker_id_frames.erase(p.first);
		g_prev_marker_xyz.erase(p.first);
	}
	/*
	OscBundleAddContents(bndl, &m_x);
	OscBundleAddContents(bndl, &m_y);
	OscBundleAddContents(bndl, &m_z);
	
	OscBundleAddContents(bndl, &m_dx);
	OscBundleAddContents(bndl, &m_dy);
	OscBundleAddContents(bndl, &m_dz);

	OscBundleAddContents(bndl, &m_moved_dist);

	OscBundleAddContents(bndl, &m_active);
	OscBundleAddContents(bndl, &m_labeled);
	OscBundleAddContents(bndl, &m_occ);
	OscBundleAddContents(bndl, &m_pc);
	OscBundleAddContents(bndl, &m_model);
	OscBundleAddContents(bndl, &m_marID);
	OscBundleAddContents(bndl, &m_modID);
	OscBundleAddContents(bndl, &m_size);
	OscBundleAddContents(bndl, &m_duration);
	*/

	/*
	OscMessageInitialise(&m_x, "/otherMarker/x");
	OscMessageInitialise(&m_y, "/otherMarker/y");
	OscMessageInitialise(&m_z, "/otherMarker/z");

	for (i = 0; i < data->nOtherMarkers; i++)
	{
		MarkerData& pos = data->OtherMarkers[i];

		OscMessageAddFloat32(&m_x, pos[0] * g_unitConversion);
		OscMessageAddFloat32(&m_y, pos[1] * g_unitConversion);
		OscMessageAddFloat32(&m_z, pos[2] * g_unitConversion);
	}

	OscBundleAddContents(bndl, &m_x);
	OscBundleAddContents(bndl, &m_y);
	OscBundleAddContents(bndl, &m_z);
	*/

	/*
	// force plates
	printf("Force Plate [Count=%d]\n", data->nForcePlates);
	for (int iPlate = 0; iPlate < data->nForcePlates; iPlate++)
	{
		printf("Force Plate %d\n", data->ForcePlates[iPlate].ID);
		for (int iChannel = 0; iChannel < data->ForcePlates[iPlate].nChannels; iChannel++)
		{
			printf("\tChannel %d:\t", iChannel);
			if (data->ForcePlates[iPlate].ChannelData[iChannel].nFrames == 0)
			{
				printf("\tEmpty Frame\n");
			}
			else if (data->ForcePlates[iPlate].ChannelData[iChannel].nFrames != g_analogSamplesPerMocapFrame)
			{
				printf("\tPartial Frame [Expected:%d   Actual:%d]\n", g_analogSamplesPerMocapFrame, data->ForcePlates[iPlate].ChannelData[iChannel].nFrames);
			}
			for (int iSample = 0; iSample < data->ForcePlates[iPlate].ChannelData[iChannel].nFrames; iSample++)
				printf("%3.2f\t", data->ForcePlates[iPlate].ChannelData[iChannel].Values[iSample]);
			printf("\n");
		}
	}

	// devices
	printf("Device [Count=%d]\n", data->nDevices);
	for (int iDevice = 0; iDevice < data->nDevices; iDevice++)
	{
		printf("Device %d\n", data->Devices[iDevice].ID);
		for (int iChannel = 0; iChannel < data->Devices[iDevice].nChannels; iChannel++)
		{
			printf("\tChannel %d:\t", iChannel);
			if (data->Devices[iDevice].ChannelData[iChannel].nFrames == 0)
			{
				printf("\tEmpty Frame\n");
			}
			else if (data->Devices[iDevice].ChannelData[iChannel].nFrames != g_analogSamplesPerMocapFrame)
			{
				printf("\tPartial Frame [Expected:%d   Actual:%d]\n", g_analogSamplesPerMocapFrame, data->Devices[iDevice].ChannelData[iChannel].nFrames);
			}
			for (int iSample = 0; iSample < data->Devices[iDevice].ChannelData[iChannel].nFrames; iSample++)
				printf("%3.2f\t", data->Devices[iDevice].ChannelData[iChannel].Values[iSample]);
			printf("\n");
		}
	}
	*/
	sendOSC(o_bundle);

}


// MessageHandler receives NatNet error/debug messages
void NATNET_CALLCONV MessageHandler(Verbosity msgType, const char* msg)
{
	// Optional: Filter out debug messages
	if (msgType < Verbosity_Info)
	{
		return;
	}

	printf("\n[NatNetLib]");

	switch (msgType)
	{
	case Verbosity_Debug:
		printf(" [DEBUG]");
		break;
	case Verbosity_Info:
		printf("  [INFO]");
		break;
	case Verbosity_Warning:
		printf("  [WARN]");
		break;
	case Verbosity_Error:
		printf(" [ERROR]");
		break;
	default:
		printf(" [?????]");
		break;
	}

	printf(": %s\n", msg);
}



void resetClient()
{
	int iSuccess;

	printf("\n\nre-setting Client\n\n.");

	iSuccess = g_pClient->Disconnect();
	if (iSuccess != 0)
		printf("error un-initting Client\n");

	iSuccess = g_pClient->Connect(g_connectParams);
	if (iSuccess != 0)
		printf("error re-initting Client\n");
}


bool sendOSC(const OSCMap & bndl)
{

	std::string serialized = bndl.getSerializedString();

	int sent = send(g_socket, serialized.data(), serialized.size(), 0);
	//printf("sent %i, size %i\n", sent, oscPacket.size);
	if (sent == SOCKET_ERROR)
	{
		printf(" sendto() failed with error code : % d ", WSAGetLastError());
		exit(EXIT_FAILURE);
	}


	return 1;
}


void setupSocket()
{
	WSADATA wsa;

	//Initialise winsock
	printf(" \nInitialising Winsock... ");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		printf(" Failed.Error Code : % d ", WSAGetLastError());
		exit(EXIT_FAILURE);
	}
	printf(" Initialised.\n ");

	//create socket
	if ((g_socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == SOCKET_ERROR)
	{
		printf(" socket() failed with error code : % d ", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	//setup address structure
	memset((char*)& g_sendToAddr, 0, sizeof(g_sendToAddr));
	g_sendToAddr.sin_family = AF_INET;
	g_sendToAddr.sin_port = htons(sendToPort);
	g_sendToAddr.sin_addr.S_un.S_addr = inet_addr(sendToIP);



	BOOL bOptVal = FALSE;
	int bOptLen = sizeof(BOOL);

	int iOptVal = 0;
	int iOptLen = sizeof(int);

	int iResult = getsockopt(g_socket, SOL_SOCKET, SO_SNDBUF, (char*)& iOptVal, &iOptLen);
	if (iResult == SOCKET_ERROR)
		printf("Error getsockopt one");
	else
		printf("send buffer size = %d\n", iOptVal);

	int new_size = 512000;
	setsockopt(g_socket, SOL_SOCKET, SO_SNDBUF, (char*)& new_size, sizeof(new_size));
	iResult = getsockopt(g_socket, SOL_SOCKET, SO_SNDBUF, (char*)& iOptVal, &iOptLen);
	if (iResult == SOCKET_ERROR)
		printf("Error getsockopt two");
	else
		printf("send buffer size = %d\n", iOptVal);


	//----------------------
// Connect to server.
	iResult = connect(g_socket, (SOCKADDR*)& g_sendToAddr, sizeof(g_sendToAddr));
	if (iResult == SOCKET_ERROR) {
		printf("connect failed with error: %d\n", WSAGetLastError());
		closesocket(g_socket);
		WSACleanup();
		return;
	}


}


void ConvertRHSPosZupToYUp(float& x, float& y, float& z)
{
	/*
	[RHS, Y-Up]     [RHS, Z-Up]

						  Y
	 Y                 Z /
	 |__ X             |/__ X
	 /
	Z

	Xyup  =  Xzup
	Yyup  =  Zzup
	Zyup  =  -Yzup
	*/
	float yOriginal = y;
	y = z;
	z = -yOriginal;
}

void ConvertRHSRotZUpToYUp(float& qx, float& qy, float& qz, float& qw)
{
	// -90 deg rotation about +X
	float qRx, qRy, qRz, qRw;
	float angle = -90.0f * M_PI / 180.0f;
	qRx = sin(angle / 2.0f);
	qRy = 0.0f;
	qRz = 0.0f;
	qRw = cos(angle / 2.0f);

	// rotate quat using quat multiply
	float qxNew, qyNew, qzNew, qwNew;
	qxNew = qw * qRx + qx * qRw + qy * qRz - qz * qRy;
	qyNew = qw * qRy - qx * qRz + qy * qRw + qz * qRx;
	qzNew = qw * qRz + qx * qRy - qy * qRx + qz * qRw;
	qwNew = qw * qRw - qx * qRx - qy * qRy - qz * qRz;

	qx = qxNew;
	qy = qyNew;
	qz = qzNew;
	qw = qwNew;
}