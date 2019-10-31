{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 0,
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
					"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 47, 99, 111, 117, 110, 116, 0, 0, 44, 105, 0, 0, 0, 0, 0, 3, 0, 0, 0, 24, 47, 105, 100, 0, 44, 105, 105, 105, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 0, 0, 52, 47, 110, 97, 109, 101, 0, 0, 0, 44, 115, 115, 115, 0, 0, 0, 0, 116, 101, 115, 116, 101, 114, 0, 0, 82, 105, 103, 105, 100, 66, 111, 100, 121, 0, 0, 0, 82, 105, 103, 105, 100, 66, 111, 100, 121, 32, 48, 48, 50, 0, 0, 0, 0, 0, 0, 24, 47, 120, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, -66, -120, 22, -119, 60, -3, 105, 53, -67, 118, -39, -113, 0, 0, 0, 24, 47, 121, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 61, 100, -70, 42, 59, -4, 41, -90, 60, 11, 61, 57, 0, 0, 0, 24, 47, 122, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 62, 62, -43, 11, 62, 100, -58, -95, 62, -60, 73, 98, 0, 0, 0, 24, 47, 113, 120, 0, 44, 102, 102, 102, 0, 0, 0, 0, 62, 35, 80, 110, -66, -13, -50, 5, 62, 120, 95, 59, 0, 0, 0, 24, 47, 113, 121, 0, 44, 102, 102, 102, 0, 0, 0, 0, -65, 100, -70, 62, -67, 73, -47, -56, 63, 33, -96, -34, 0, 0, 0, 24, 47, 113, 122, 0, 44, 102, 102, 102, 0, 0, 0, 0, -66, 108, 109, 43, -66, -91, 76, 51, 61, -98, -70, 33, 0, 0, 0, 24, 47, 113, 119, 0, 44, 102, 102, 102, 0, 0, 0, 0, -66, -77, -117, -78, -65, 81, 2, -4, -65, 59, -124, -88, 0, 0, 0, 28, 47, 121, 97, 119, 0, 0, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, -64, 61, -7, 81, 63, 33, 99, -10, 63, 74, 98, 32, 0, 0, 0, 28, 47, 112, 105, 116, 99, 104, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 63, 70, -102, 25, -66, 106, -128, -64, -65, -91, -23, -121, 0, 0, 0, 28, 47, 114, 111, 108, 108, 0, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 64, 45, 59, -96, 63, 123, 36, -73, -65, -96, 51, 1, 0, 0, 0, 24, 47, 118, 97, 108, 105, 100, 84, 114, 97, 99, 107, 105, 110, 103, 0, 0, 44, 84, 84, 84, 0, 0, 0, 0, 0, 0, 0, 32, 47, 109, 101, 97, 110, 69, 114, 114, 111, 114, 0, 0, 44, 102, 102, 102, 0, 0, 0, 0, 58, 71, 43, 107, 58, 66, -91, -37, 58, 106, 105, -99 ],
					"saved_bundle_length" : 476,
					"text" : "/count : 3,\n/id : [1, 2, 3],\n/name : [\"tester\", \"RigidBody\", \"RigidBody 002\"],\n/x : [-0.265805, 0.0309453, -0.0602721],\n/y : [0.0558399, 0.0077, 0.00849137],\n/z : [0.186372, 0.223456, 0.383381],\n/qx : [0.159539, -0.476152, 0.242595],\n/qy : [-0.893468, -0.0490669, 0.631302],\n/qz : [-0.230904, -0.322967, 0.0775122],\n/qw : [-0.350637, -0.816434, -0.732529],\n/yaw : [-2.96821, 0.63049, 0.790197],\n/pitch : [0.775736, -0.229451, -1.29608],\n/roll : [2.70677, 0.980841, -1.25127],\n/validTracking : [true, true, true],\n/meanError : [0.000754261, 0.000719573, 0.000900434]"
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
				"patcherrelativepath" : "../../../../Max 8/Library/modosc",
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
