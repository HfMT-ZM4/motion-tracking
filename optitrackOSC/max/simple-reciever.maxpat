{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 59.0, 104.0, 1186.0, 912.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-18",
					"linecount" : 6,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 371.0, 110.0, 50.0, 89.0 ],
					"text" : "FullPacket 1548 140297817639952"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 429.0, 142.0, 103.0, 22.0 ],
					"text" : "o.route /rigidBody"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-10",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 745.0, 191.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 737.0, 116.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "float", "" ],
					"patching_rect" : [ 745.0, 151.0, 35.0, 22.0 ],
					"text" : "timer"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 214.0, 124.0, 100.0, 22.0 ],
					"text" : "mo.distance"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-4",
					"linecount" : 15,
					"maxclass" : "o.compose",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 205.0, 557.0, 214.0 ],
					"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 47, 99, 111, 117, 110, 116, 0, 0, 44, 105, 0, 0, 0, 0, 0, 3, 0, 0, 0, 24, 47, 105, 100, 0, 44, 105, 105, 105, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 52, 47, 110, 97, 109, 101, 0, 0, 0, 44, 115, 115, 115, 0, 0, 0, 0, 116, 101, 115, 116, 101, 114, 0, 0, 82, 105, 103, 105, 100, 66, 111, 100, 121, 0, 0, 0, 82, 105, 103, 105, 100, 66, 111, 100, 121, 32, 48, 48, 50, 0, 0, 0, 0, 0, 0, 24, 47, 120, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 62, -60, -114, 118, 62, -38, -18, -127, 62, -48, 23, -104, 0, 0, 0, 24, 47, 121, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, -67, -12, -94, 10, -66, 61, 13, 67, -66, 12, -120, -125, 0, 0, 0, 24, 47, 122, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, -66, -112, 74, -12, -66, 112, 27, 96, -66, -107, 106, 91, 0, 0, 0, 24, 47, 113, 120, 0, 44, 102, 102, 102, 0, 0, 0, 0, -66, -11, -71, -116, -67, -84, -124, 85, 62, -91, -69, 65, 0, 0, 0, 24, 47, 113, 121, 0, 44, 102, 102, 102, 0, 0, 0, 0, 63, 56, 1, -67, 62, -40, 93, 116, -65, 89, 25, 110, 0, 0, 0, 24, 47, 113, 122, 0, 44, 102, 102, 102, 0, 0, 0, 0, 63, 0, -62, -68, -66, -16, -127, 117, -66, -56, -13, -91, 0, 0, 0, 24, 47, 113, 119, 0, 44, 102, 102, 102, 0, 0, 0, 0, -69, -34, -80, -1, 63, 69, 63, 124, -66, 23, -31, -70, 0, 0, 0, 28, 47, 121, 97, 119, 0, 0, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, -64, 14, -81, 5, -65, -87, 73, 42, -64, 39, 114, 122, 0, 0, 0, 28, 47, 112, 105, 116, 99, 104, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 62, -4, 68, 66, 63, 27, -23, 49, 63, 7, -73, 118, 0, 0, 0, 28, 47, 114, 111, 108, 108, 0, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 64, 10, -98, -42, -65, 50, -113, 72, 64, 26, -25, 96, 0, 0, 0, 24, 47, 118, 97, 108, 105, 100, 84, 114, 97, 99, 107, 105, 110, 103, 0, 0, 44, 70, 70, 70, 0, 0, 0, 0, 0, 0, 0, 32, 47, 109, 101, 97, 110, 69, 114, 114, 111, 114, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
					"saved_bundle_length" : 476,
					"text" : "/count : 3,\n/id : [1, 2, 3],\n/name : [\"tester\", \"RigidBody\", \"RigidBody 002\"],\n/x : [0.383899, 0.427601, 0.40643],\n/y : [-0.11945, -0.184621, -0.13724],\n/z : [-0.281822, -0.234479, -0.291827],\n/qx : [-0.479931, -0.0842368, 0.323694],\n/qy : [0.718777, 0.422588, -0.848044],\n/qz : [0.502971, -0.469738, -0.392484],\n/qw : [-0.006796, 0.7705, -0.148322],\n/yaw : [-2.22943, -1.32255, -2.61636],\n/pitch : [0.492708, 0.609027, 0.530143],\n/roll : [2.16594, -0.697499, 2.42037],\n/validTracking : [false, false, false],\n/meanError : [0., 0., 0.]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.0, 59.0, 133.0, 22.0 ],
					"text" : "udpreceive 8888 cnmat"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 429.0, 29.0, 116.0, 22.0 ],
					"text" : "maxqueuesize 4096"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"order" : 2,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"order" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"order" : 1,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "mo.distance.maxpat",
				"bootpath" : "~/Documents/Max 8/Library/modosc",
				"patcherrelativepath" : "../../Max 8/Library/modosc",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.compose.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.union.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.expr.codebox.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.if.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.pack.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.select.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.var.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
