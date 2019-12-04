{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 79.0, 1362.0, 937.0 ],
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
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-97",
					"maxclass" : "o.display",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 396.0, 832.0, 126.0, 34.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 571.0, 127.999999999999943, 65.0, 22.0 ],
					"text" : "append /id"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 198.0, 180.0, 48.0, 22.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-64",
									"linecount" : 2,
									"maxclass" : "o.expr.codebox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "FullPacket", "FullPacket" ],
									"patching_rect" : [ 50.0, 100.0, 306.0, 46.0 ],
									"text" : "if( strchar(0, /filtertype) != \"/\", /filtertype = \"/\"+/filtertype)"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-80",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "FullPacket" ],
									"patching_rect" : [ 50.0, 40.000000000000227, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-81",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 206.000000000000227, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-80", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 752.0, 172.696167000000003, 70.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p add slash"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 198.0, 123.0, 87.0, 22.0 ],
					"text" : "o.gather.select"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 643.0, 128.0, 81.0, 22.0 ],
					"text" : "o.pack /addrs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 529.0, 31.999999999999943, 50.0, 22.0 ],
					"text" : "/x /y /z"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 939.0, 79.696166999999889, 50.0, 22.0 ],
					"text" : "lp_01"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1207.0, 434.0, 50.0, 22.0 ],
					"text" : "lp_01"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-62",
					"linecount" : 2,
					"maxclass" : "o.display",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1078.0, 593.0, 126.0, 48.0 ],
					"text" : "/filtertype : \"/lp_01\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1116.0, 429.0, 50.0, 22.0 ],
					"text" : "/foo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 1087.0, 472.999999999999886, 96.0, 22.0 ],
					"text" : "o.pack /filtertype"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-56",
					"linecount" : 2,
					"maxclass" : "o.expr.codebox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 1078.0, 514.0, 306.0, 46.0 ],
					"text" : "if( strchar(0, /filtertype[[0]]) != \"/\", /filtertype = \"/\"+/filtertype[[0]])"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 752.0, 141.696166999999889, 96.0, 22.0 ],
					"text" : "o.pack /filtertype"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 939.0, 153.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 716.666666666666629, 79.696166999999889, 125.0, 22.0 ],
					"text" : "route addrs type done"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 848.0, 315.0, 164.0, 33.0 ],
					"text" : "modosc.filter /x /y /z @type /lp_d_01 "
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 827.696167000000059, 313.0, 20.0 ],
					"presentation_linecount" : 3,
					"text" : "http://www.arj.no/wp-content/2013/05/Skogstad_2013.pdf"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 846.0, 440.0, 20.0 ],
					"text" : "https://www.hf.uio.no/imv/english/research/projects/sma/subprojects/mocapfilters/"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 13.0, 104.0, 59.0, 22.0 ],
					"text" : "$1 $1 $1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-41",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 16.5, 70.000000000000114, 112.5, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 16.5, 157.0, 102.0, 22.0 ],
					"text" : "o.pack /x /y 0 /z 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 262.0, 787.696167000000059, 69.0, 22.0 ],
					"text" : "o.route /out"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 1105.5, 196.696166999999775, 96.0, 22.0 ],
					"text" : "o.pack /filtertype"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1056.0, 25.696166999999832, 197.0, 20.0 ],
					"text" : "list oriented version of modosc filter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 663.666666666666629, 9.696166999999889, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 84.0, 129.0, 707.0, 480.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "FullPacket" ],
									"patching_rect" : [ 50.0, 236.0, 177.0, 22.0 ],
									"text" : "o.gather.select /coeffs /filtertype"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-34",
									"maxclass" : "o.expr.codebox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "FullPacket", "FullPacket" ],
									"patching_rect" : [ 50.0, 174.0, 587.0, 32.0 ],
									"text" : "/coeffs = [value(/filtertype)[[0,1,2,3,4]], -1 * value(/filtertype)[[6,7,8,9]] ]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "FullPacket" ],
									"patching_rect" : [ 50.0, 134.0, 188.0, 22.0 ],
									"text" : "o.union"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "FullPacket" ],
									"patching_rect" : [ 50.0, 40.000000000000114, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "FullPacket" ],
									"patching_rect" : [ 219.0, 40.000000000000114, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-9",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 318.000000000000114, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1106.0, 235.999999999999943, 114.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p select"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "clear", "FullPacket" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 84.0, 129.0, 1252.0, 724.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 1,
											"revision" : 1,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 495.0, 213.0, 1151.0, 649.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"fontface" : 0,
													"fontsize" : 12.0,
													"id" : "obj-17",
													"linecount" : 23,
													"maxclass" : "o.compose",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 76.0, 439.0, 1007.0, 323.0 ],
													"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 68, 47, 110, 111, 95, 102, 105, 108, 116, 101, 114, 105, 110, 103, 0, 0, 0, 44, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 47, 112, 98, 95, 48, 46, 49, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 102, 105, 108, 116, 101, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -63, -18, -69, 52, 30, 20, -66, -65, -95, -103, -19, 124, 111, -67, 39, 63, -89, 62, -75, 71, 117, 9, -105, 63, -124, 108, -43, -106, 74, 3, -38, 63, 75, -51, -39, -16, -86, 85, 49, 0, 0, 0, 1, -65, -2, -78, 86, -1, -63, 21, -33, 63, -7, 124, -82, -89, 71, -40, 6, -65, -29, 1, -51, 95, -103, -61, -117, 63, -76, -37, 33, -6, 37, -53, 108, 0, 0, 0, 116, 47, 112, 98, 95, 48, 46, 50, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 102, 105, 108, 116, 101, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -61, -119, 55, 75, -58, -89, -16, 63, -95, 19, 0, -115, -60, 121, 65, 63, -77, -25, -61, -55, 24, 12, 102, 63, -79, 20, 51, -109, -85, 67, 15, 63, -116, 116, -72, 56, -63, 17, -82, 0, 0, 0, 1, -65, -5, -16, -124, 97, -7, -16, 28, 63, -5, -60, 61, 70, -78, 107, -8, -65, -22, 88, 54, 33, -6, -4, -117, 63, -58, -12, -49, 74, 85, -114, -88, 0, 0, 0, 116, 47, 112, 98, 95, 48, 46, 51, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 102, 105, 108, 116, 101, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -57, -78, -52, 112, -122, 122, -39, 63, -63, -76, -69, 94, 15, 127, -48, 63, -58, 92, 53, -118, -4, 71, -27, 63, -70, -53, 49, -62, 25, -21, 100, 63, -89, -58, -58, 34, -114, -96, 65, 0, 0, 0, 1, -65, -12, -59, -105, 78, 101, -66, -95, 63, -9, 106, 32, -102, -86, 58, -46, -65, -26, -67, -91, 17, -100, -32, 118, 63, -55, -8, 26, 88, 112, -38, 94, 0, 0, 0, 116, 47, 112, 98, 95, 48, 46, 52, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 102, 105, 108, 116, 101, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -47, 40, 124, 32, 12, 15, 2, 63, -32, -114, -30, -122, 114, 117, 104, 63, -30, -80, 15, -3, -92, 5, 45, 63, -41, -3, -55, -60, -38, -112, 4, 63, -66, -76, 82, -126, -125, -45, 95, 0, 0, 0, 1, 63, -96, -98, -70, 106, -54, 121, 53, 63, -24, -97, 89, -52, -6, -17, -10, -65, 125, 66, 18, -97, 20, 1, -21, 63, -78, 75, 30, 11, -125, -63, -63, 0, 0, 0, 116, 47, 112, 98, 95, 48, 46, 53, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 102, 105, 108, 116, 101, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -41, -32, 42, 119, -94, -50, -51, 63, -20, -66, -8, -50, -77, 86, -38, 63, -18, -22, 45, 47, -29, -13, 90, 63, -32, -101, 84, 25, 92, -56, 88, 63, -68, 34, 120, -48, -52, 53, -50, 0, 0, 0, 1, 63, -23, -59, 27, -109, 3, 125, 99, 63, -23, -12, 50, 1, 4, 11, -2, 63, -50, 92, 36, -60, 4, -89, 47, 63, -75, -67, -21, -120, 121, -74, -91, 0, 0, 0, 124, 47, 112, 98, 95, 48, 46, 49, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -61, -64, -88, -46, 27, -63, 39, 63, -58, 77, 118, -85, 88, 7, -1, -65, -110, 81, 106, 85, -33, 47, -90, -65, 98, -46, 90, -128, 84, 35, 67, 63, 49, 83, 31, -56, -39, 94, 103, 0, 0, 0, 1, -64, 0, 117, -67, 81, 46, -58, -67, 63, -3, -67, 70, -78, 107, -8, 119, -65, -23, -88, 57, 4, 45, -116, 42, 63, -64, -57, 25, 46, -91, 46, -7, 0, 0, 0, 124, 47, 112, 98, 95, 48, 46, 50, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -55, 67, 90, -56, -93, 114, 96, -65, 119, 43, -123, -108, -44, -29, -56, -65, -96, 122, -112, -65, -42, 68, 69, -65, -68, 37, 91, 3, 91, -43, 19, -65, -87, 98, -62, 108, -9, 122, 32, 0, 0, 0, 1, -65, -17, -106, 36, -102, 19, 60, 29, 63, -24, -31, 42, 81, -29, 33, -93, -65, -52, 63, 95, -111, 96, 15, 52, 63, -100, -49, 40, -57, -97, 102, 98, 0, 0, 0, 124, 47, 112, 98, 95, 48, 46, 51, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -47, 92, 32, -110, 70, -65, 1, 63, -64, -15, 102, -32, 8, -23, -76, -65, -88, -14, -76, -67, -30, 78, 62, -65, -58, -45, -23, 32, -64, 105, -24, -65, -58, -103, 15, 48, 30, -85, -67, 0, 0, 0, 1, -65, -46, -81, 70, -86, 8, 124, -90, 63, -32, 85, -70, -78, 24, 21, -96, -65, -113, -25, 91, -60, 75, -12, -53, 63, 50, -100, -70, -74, 73, -45, -119, 0, 0, 0, 124, 47, 112, 98, 95, 48, 46, 52, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -42, 25, -97, -28, 54, 117, -34, -65, -56, -127, 85, -43, -11, 106, 123, 63, -77, 37, -77, 23, -17, -32, -50, 63, -48, 31, 87, -76, 27, -5, -33, 63, -54, -29, 12, -86, 50, 110, 17, 0, 0, 0, 1, -65, -72, 48, -12, -108, -111, -14, -36, 63, -25, -120, -40, -20, -107, -65, -16, -65, -63, 113, -22, -2, -26, -5, 76, 63, -77, 67, -124, -70, 14, -124, 39, 0, 0, 0, 124, 47, 112, 98, 95, 48, 46, 53, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -35, 56, -80, 74, -74, 6, -72, -65, -43, -41, 81, -117, 13, 14, -36, 63, -63, 35, -86, -1, -13, 106, -58, 63, -38, 40, -19, 95, 19, -117, -50, 63, -48, 85, 62, -10, -75, -44, 99, 0, 0, 0, 1, 63, -39, -15, 94, 124, -115, 25, 89, 63, -23, 39, -27, 33, 87, 104, -99, -65, -112, -4, 113, -42, 6, 49, 114, 63, -70, 99, 98, -91, -25, -123, -74, 0, 0, 0, -124, 47, 112, 98, 95, 48, 46, 49, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 111, 117, 98, 108, 101, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -78, -21, 11, 124, 53, 4, -59, 63, -63, 76, -3, 8, -44, -70, -40, -65, -86, 67, -9, -90, -107, 42, -97, -65, 125, -34, 9, -74, 12, 65, 1, -65, 101, -29, 59, -49, 14, 26, -96, 0, 0, 0, 1, -65, -6, 13, 121, -48, -90, 118, 33, 63, -10, -77, 61, -81, -115, -9, -91, -65, -29, -22, 57, -59, 29, -85, -30, 63, -69, -56, 125, -78, -77, 70, 19, 0, 0, 0, -124, 47, 112, 98, 95, 48, 46, 50, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 111, 117, 98, 108, 101, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -76, 93, -38, -90, -86, 35, 85, 63, -63, -51, 20, 26, 105, 55, -46, -65, -88, -120, -32, -28, -79, -59, -32, -65, 105, -59, 110, 51, -70, 65, -80, -65, -127, 77, -117, -7, -13, -52, 107, 0, 0, 0, 1, -65, -7, 34, -16, 90, 112, -114, -34, 63, -9, 88, -20, -107, -65, -16, 69, -65, -26, -12, -70, 81, -96, 5, -60, 63, -61, 11, -23, 66, 78, 89, 41, 0, 0, 0, -124, 47, 112, 98, 95, 48, 46, 51, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 111, 117, 98, 108, 101, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -68, 35, 116, 121, 78, -96, 119, -65, -64, -128, 48, 60, 7, -18, 11, -65, -93, 20, -98, -13, 117, -82, 2, 63, -106, 32, 117, -63, 77, 60, -54, 63, -95, -66, 86, -24, 68, 33, -104, 0, 0, 0, 1, -65, -22, 122, -42, -53, 83, 80, 9, 63, -23, -12, 89, -39, -112, 41, -82, -65, -42, -104, -2, 105, 39, 11, 7, 63, -80, -28, -89, -76, -27, 79, 123, 0, 0, 0, -124, 47, 112, 98, 95, 48, 46, 52, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 111, 117, 98, 108, 101, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -63, -34, 38, -111, 100, 64, -14, -65, -65, 77, -33, -122, -29, -76, 112, -65, -73, -90, -28, 4, -9, -74, -123, -65, 123, -100, 107, 91, 23, -45, -79, 63, -76, -14, 64, -6, -100, 18, -15, 0, 0, 0, 1, -65, -41, 64, -102, 36, 3, 20, -121, 63, -28, 89, -58, -80, 83, 25, -125, -65, -45, 25, 50, -42, -20, -31, 63, 63, -79, 86, -47, -99, -20, -27, 113, 0, 0, 0, -124, 47, 112, 98, 95, 48, 46, 53, 48, 48, 48, 95, 108, 111, 119, 45, 112, 97, 115, 115, 95, 100, 111, 117, 98, 108, 101, 95, 100, 105, 102, 102, 101, 114, 101, 110, 116, 105, 97, 116, 111, 114, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -54, 2, -81, -35, -88, -67, 35, -65, -72, -85, 12, -120, -92, 126, -48, -65, -49, -54, 7, -10, 110, -122, -58, -65, -101, -79, 20, -32, 97, -43, 7, 63, -59, -109, 3, 125, 99, 2, 46, 0, 0, 0, 1, 63, -29, -76, -8, 47, 81, 38, 99, 63, -32, -87, -40, 64, -98, 85, -63, -65, 111, 104, 123, 19, -100, -108, -9, 63, -110, -120, 72, 56, 125, -11, -49 ],
													"saved_bundle_length" : 2008,
													"text" : "/no_filtering : [1, 0, 0, 0, 0, 1, 0, 0, 0, 0],\n/pb_0.1000_low-pass_filter : [0.140098, -0.0343775, 0.0454003, 0.00997321, 0.000848514, 1, -1.91854, 1.59294, -0.59397, 0.0814687],\n/pb_0.2000_low-pass_filter : [0.152625, 0.0333481, 0.0777552, 0.0667145, 0.0138945, 1, -1.74622, 1.73541, -0.823268, 0.179346],\n/pb_0.3000_low-pass_filter : [0.185144, 0.138328, 0.174689, 0.104663, 0.0464384, 1, -1.29824, 1.46341, -0.71065, 0.202884],\n/pb_0.4000_low-pass_filter : [0.268096, 0.517442, 0.583992, 0.374865, 0.119939, 1, 0.032461, 0.769452, -0.00714309, 0.0714587],\n/pb_0.5000_low-pass_filter : [0.373057, 0.898312, 0.966086, 0.518961, 0.109901, 1, 0.805311, 0.811059, 0.237187, 0.0849292],\n/pb_0.1000_low-pass_differentiator : [-0.154317, 0.174239, -0.0178887, -0.00229757, 0.000264354, 1, -2.05749, 1.85871, -0.801785, 0.131076],\n/pb_0.2000_low-pass_differentiator : [0.197368, -0.00565674, -0.0321851, -0.109945, -0.0495816, 1, -0.987078, 0.777486, -0.220684, 0.028134],\n/pb_0.3000_low-pass_differentiator : [0.271248, 0.132367, -0.0487267, -0.178342, -0.176546, 1, -0.291948, 0.510465, -0.015578, 0.000284],\n/pb_0.4000_low-pass_differentiator : [-0.345314, -0.191447, 0.074794, 0.251913, 0.210054, 1, -0.094497, 0.735455, -0.136289, 0.075249],\n/pb_0.5000_low-pass_differentiator : [-0.456585, -0.341267, 0.133901, 0.408748, 0.255203, 1, 0.405357, 0.78612, -0.016588, 0.103079],\n/pb_0.1000_low-pass_double_differentiator : [-0.073899, 0.135162, -0.0512998, -0.00729183, -0.00267183, 1, -1.62829, 1.41876, -0.622342, 0.108528],\n/pb_0.2000_low-pass_double_differentiator : [-0.0795571, 0.139071, -0.0479193, -0.0031459, -0.00844869, 1, -1.57103, 1.45921, -0.717374, 0.148801],\n/pb_0.3000_low-pass_double_differentiator : [0.109916, -0.128912, -0.0372667, 0.0216082, 0.0346553, 1, -0.827495, 0.811078, -0.353088, 0.065989],\n/pb_0.4000_low-pass_double_differentiator : [0.139592, -0.122282, -0.0923903, -0.00674097, 0.0818215, 1, -0.363318, 0.635959, -0.298413, 0.067731],\n/pb_0.5000_low-pass_double_differentiator : [0.203207, -0.09636, -0.248353, -0.0270427, 0.168549, 1, 0.615841, 0.520733, -0.003834, 0.018098]"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-16",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 318.5, 392.0, 100.0, 22.0 ],
													"text" : "o.accum"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-15",
													"linecount" : 2,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 607.0, 233.884246999999959, 100.0, 35.0 ],
													"text" : "tosymbol @separator _"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 607.0, 280.0, 100.0, 22.0 ],
													"text" : "sprintf set /%s"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "FullPacket" ],
													"patching_rect" : [ 318.5, 355.0, 100.0, 22.0 ],
													"text" : "o.pack /f"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 256.0, 23.0, 24.0, 24.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 318.0, 139.015593999999993, 33.0, 22.0 ],
													"text" : "!- 15"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 318.0, 108.146973000000003, 29.5, 22.0 ],
													"text" : "- 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "int" ],
													"patching_rect" : [ 237.0, 77.0, 100.0, 22.0 ],
													"text" : "uzi 16"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 318.0, 206.146973000000003, 32.5, 22.0 ],
													"text" : "+ 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 318.5, 298.752837999999997, 57.0, 22.0 ],
													"text" : "route set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-13",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 318.0, 237.015593999999993, 46.0, 22.0 ],
													"text" : "line $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "bang", "int" ],
													"patching_rect" : [ 318.0, 267.884246999999959, 242.0, 22.0 ],
													"text" : "text SkogstadCoefficients.txt @precision 10"
												}

											}
, 											{
												"box" : 												{
													"allowdrag" : 0,
													"id" : "obj-20",
													"items" : [ "no", "filtering", ",", "pb", 0.1, "low-pass", "filter", ",", "pb", 0.2, "low-pass", "filter", ",", "pb", 0.3, "low-pass", "filter", ",", "pb", 0.4, "low-pass", "filter", ",", "pb", 0.5, "low-pass", "filter", ",", "pb", 0.1, "low-pass", "differentiator", ",", "pb", 0.2, "low-pass", "differentiator", ",", "pb", 0.3, "low-pass", "differentiator", ",", "pb", 0.4, "low-pass", "differentiator", ",", "pb", 0.5, "low-pass", "differentiator", ",", "pb", 0.1, "low-pass", "double", "differentiator", ",", "pb", 0.2, "low-pass", "double", "differentiator", ",", "pb", 0.3, "low-pass", "double", "differentiator", ",", "pb", 0.4, "low-pass", "double", "differentiator", ",", "pb", 0.5, "low-pass", "double", "differentiator" ],
													"maxclass" : "umenu",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 318.0, 173.750945999999999, 194.0, 22.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-1", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 1 ],
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"source" : [ "obj-20", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 689.75, 481.999999999999943, 98.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p getFilterCoeffs"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 481.999999999999943, 25.0, 22.0 ],
									"text" : "iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 522.0, 100.0, 22.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "clear" ],
									"patching_rect" : [ 50.0, 447.999999999999943, 47.0, 22.0 ],
									"text" : "t l clear"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "FullPacket" ],
									"patching_rect" : [ 50.0, 409.999999999999943, 83.0, 22.0 ],
									"text" : "o.route /menu"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "o.expr.codebox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "FullPacket", "FullPacket" ],
									"patching_rect" : [ 50.0, 353.999999999999943, 205.0, 32.0 ],
									"text" : "/menu = getaddresses()"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 0,
									"fontsize" : 12.0,
									"id" : "obj-7",
									"linecount" : 16,
									"maxclass" : "o.compose",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 1079.0, 228.0 ],
									"saved_bundle_data" : [ 35, 98, 117, 110, 100, 108, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 47, 116, 104, 114, 117, 0, 0, 0, 44, 105, 105, 105, 105, 105, 105, 105, 105, 105, 105, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 47, 108, 112, 95, 48, 49, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -63, -18, -69, 52, 30, 20, -66, -65, -95, -103, -19, 124, 111, -67, 39, 63, -89, 62, -75, 71, 117, 9, -105, 63, -124, 108, -43, -106, 74, 3, -38, 63, 75, -51, -39, -16, -86, 85, 49, 0, 0, 0, 1, -65, -2, -78, 86, -1, -63, 21, -33, 63, -7, 124, -82, -89, 71, -40, 6, -65, -29, 1, -51, 95, -103, -61, -117, 63, -76, -37, 33, -6, 37, -53, 108, 0, 0, 0, 96, 47, 108, 112, 95, 48, 50, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -61, -119, 55, 75, -58, -89, -16, 63, -95, 19, 0, -115, -60, 121, 65, 63, -77, -25, -61, -55, 24, 12, 102, 63, -79, 20, 51, -109, -85, 67, 15, 63, -116, 116, -72, 56, -63, 17, -82, 0, 0, 0, 1, -65, -5, -16, -124, 97, -7, -16, 28, 63, -5, -60, 61, 70, -78, 107, -8, -65, -22, 88, 54, 33, -6, -4, -117, 63, -58, -12, -49, 74, 85, -114, -88, 0, 0, 0, 96, 47, 108, 112, 95, 48, 51, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -57, -78, -52, 112, -122, 122, -39, 63, -63, -76, -69, 94, 15, 127, -48, 63, -58, 92, 53, -118, -4, 71, -27, 63, -70, -53, 49, -62, 25, -21, 100, 63, -89, -58, -58, 34, -114, -96, 65, 0, 0, 0, 1, -65, -12, -59, -105, 78, 101, -66, -95, 63, -9, 106, 32, -102, -86, 58, -46, -65, -26, -67, -91, 17, -100, -32, 118, 63, -55, -8, 26, 88, 112, -38, 94, 0, 0, 0, 96, 47, 108, 112, 95, 48, 52, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -47, 40, 124, 32, 12, 15, 2, 63, -32, -114, -30, -122, 114, 117, 104, 63, -30, -80, 15, -3, -92, 5, 45, 63, -41, -3, -55, -60, -38, -112, 4, 63, -66, -76, 82, -126, -125, -45, 95, 0, 0, 0, 1, 63, -96, -98, -70, 106, -54, 121, 53, 63, -24, -97, 89, -52, -6, -17, -10, -65, 125, 66, 18, -97, 20, 1, -21, 63, -78, 75, 30, 11, -125, -63, -63, 0, 0, 0, 96, 47, 108, 112, 95, 48, 53, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -41, -32, 42, 119, -94, -50, -51, 63, -20, -66, -8, -50, -77, 86, -38, 63, -18, -22, 45, 47, -29, -13, 90, 63, -32, -101, 84, 25, 92, -56, 88, 63, -68, 34, 120, -48, -52, 53, -50, 0, 0, 0, 1, 63, -23, -59, 27, -109, 3, 125, 99, 63, -23, -12, 50, 1, 4, 11, -2, 63, -50, 92, 36, -60, 4, -89, 47, 63, -75, -67, -21, -120, 121, -74, -91, 0, 0, 0, 100, 47, 108, 112, 95, 100, 95, 48, 49, 0, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -61, -64, -88, -46, 27, -63, 39, 63, -58, 77, 118, -85, 88, 7, -1, -65, -110, 81, 106, 85, -33, 47, -90, -65, 98, -46, 90, -128, 84, 35, 67, 63, 49, 83, 31, -56, -39, 94, 103, 0, 0, 0, 1, -64, 0, 117, -67, 81, 46, -58, -67, 63, -3, -67, 70, -78, 107, -8, 119, -65, -23, -88, 57, 4, 45, -116, 42, 63, -64, -57, 25, 46, -91, 46, -7, 0, 0, 0, 100, 47, 108, 112, 95, 100, 95, 48, 50, 0, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -55, 67, 90, -56, -93, 114, 96, -65, 119, 43, -123, -108, -44, -29, -56, -65, -96, 122, -112, -65, -42, 68, 69, -65, -68, 37, 91, 3, 91, -43, 19, -65, -87, 98, -62, 108, -9, 122, 32, 0, 0, 0, 1, -65, -17, -106, 36, -102, 19, 60, 29, 63, -24, -31, 42, 81, -29, 33, -93, -65, -52, 63, 95, -111, 96, 15, 52, 63, -100, -49, 40, -57, -97, 102, 98, 0, 0, 0, 100, 47, 108, 112, 95, 100, 95, 48, 51, 0, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -47, 92, 32, -110, 70, -65, 1, 63, -64, -15, 102, -32, 8, -23, -76, -65, -88, -14, -76, -67, -30, 78, 62, -65, -58, -45, -23, 32, -64, 105, -24, -65, -58, -103, 15, 48, 30, -85, -67, 0, 0, 0, 1, -65, -46, -81, 70, -86, 8, 124, -90, 63, -32, 85, -70, -78, 24, 21, -96, -65, -113, -25, 91, -60, 75, -12, -53, 63, 50, -100, -70, -74, 73, -45, -119, 0, 0, 0, 100, 47, 108, 112, 95, 100, 95, 48, 52, 0, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -42, 25, -97, -28, 54, 117, -34, -65, -56, -127, 85, -43, -11, 106, 123, 63, -77, 37, -77, 23, -17, -32, -50, 63, -48, 31, 87, -76, 27, -5, -33, 63, -54, -29, 12, -86, 50, 110, 17, 0, 0, 0, 1, -65, -72, 48, -12, -108, -111, -14, -36, 63, -25, -120, -40, -20, -107, -65, -16, -65, -63, 113, -22, -2, -26, -5, 76, 63, -77, 67, -124, -70, 14, -124, 39, 0, 0, 0, 100, 47, 108, 112, 95, 100, 95, 48, 53, 0, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -35, 56, -80, 74, -74, 6, -72, -65, -43, -41, 81, -117, 13, 14, -36, 63, -63, 35, -86, -1, -13, 106, -58, 63, -38, 40, -19, 95, 19, -117, -50, 63, -48, 85, 62, -10, -75, -44, 99, 0, 0, 0, 1, 63, -39, -15, 94, 124, -115, 25, 89, 63, -23, 39, -27, 33, 87, 104, -99, -65, -112, -4, 113, -42, 6, 49, 114, 63, -70, 99, 98, -91, -25, -123, -74, 0, 0, 0, 100, 47, 108, 112, 95, 100, 100, 95, 48, 49, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -78, -21, 11, 124, 53, 4, -59, 63, -63, 76, -3, 8, -44, -70, -40, -65, -86, 67, -9, -90, -107, 42, -97, -65, 125, -34, 9, -74, 12, 65, 1, -65, 101, -29, 59, -49, 14, 26, -96, 0, 0, 0, 1, -65, -6, 13, 121, -48, -90, 118, 33, 63, -10, -77, 61, -81, -115, -9, -91, -65, -29, -22, 57, -59, 29, -85, -30, 63, -69, -56, 125, -78, -77, 70, 19, 0, 0, 0, 100, 47, 108, 112, 95, 100, 100, 95, 48, 50, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, -65, -76, 93, -38, -90, -86, 35, 85, 63, -63, -51, 20, 26, 105, 55, -46, -65, -88, -120, -32, -28, -79, -59, -32, -65, 105, -59, 110, 51, -70, 65, -80, -65, -127, 77, -117, -7, -13, -52, 107, 0, 0, 0, 1, -65, -7, 34, -16, 90, 112, -114, -34, 63, -9, 88, -20, -107, -65, -16, 69, -65, -26, -12, -70, 81, -96, 5, -60, 63, -61, 11, -23, 66, 78, 89, 41, 0, 0, 0, 100, 47, 108, 112, 95, 100, 100, 95, 48, 51, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -68, 35, 116, 121, 78, -96, 119, -65, -64, -128, 48, 60, 7, -18, 11, -65, -93, 20, -98, -13, 117, -82, 2, 63, -106, 32, 117, -63, 77, 60, -54, 63, -95, -66, 86, -24, 68, 33, -104, 0, 0, 0, 1, -65, -22, 122, -42, -53, 83, 80, 9, 63, -23, -12, 89, -39, -112, 41, -82, -65, -42, -104, -2, 105, 39, 11, 7, 63, -80, -28, -89, -76, -27, 79, 123, 0, 0, 0, 100, 47, 108, 112, 95, 100, 100, 95, 48, 52, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -63, -34, 38, -111, 100, 64, -14, -65, -65, 77, -33, -122, -29, -76, 112, -65, -73, -90, -28, 4, -9, -74, -123, -65, 123, -100, 107, 91, 23, -45, -79, 63, -76, -14, 64, -6, -100, 18, -15, 0, 0, 0, 1, -65, -41, 64, -102, 36, 3, 20, -121, 63, -28, 89, -58, -80, 83, 25, -125, -65, -45, 25, 50, -42, -20, -31, 63, 63, -79, 86, -47, -99, -20, -27, 113, 0, 0, 0, 100, 47, 108, 112, 95, 100, 100, 95, 48, 53, 0, 0, 0, 44, 100, 100, 100, 100, 100, 105, 100, 100, 100, 100, 0, 63, -54, 2, -81, -35, -88, -67, 35, -65, -72, -85, 12, -120, -92, 126, -48, -65, -49, -54, 7, -10, 110, -122, -58, -65, -101, -79, 20, -32, 97, -43, 7, 63, -59, -109, 3, 125, 99, 2, 46, 0, 0, 0, 1, 63, -29, -76, -8, 47, 81, 38, 99, 63, -32, -87, -40, 64, -98, 85, -63, -65, 111, 104, 123, 19, -100, -108, -9, 63, -110, -120, 72, 56, 125, -11, -49 ],
									"saved_bundle_length" : 1620,
									"text" : "/thru : [1, 0, 0, 0, 0, 1, 0, 0, 0, 0],\n/lp_01 : [0.140098, -0.0343775, 0.0454003, 0.00997321, 0.000848514, 1, -1.91854, 1.59294, -0.59397, 0.0814687],\n/lp_02 : [0.152625, 0.0333481, 0.0777552, 0.0667145, 0.0138945, 1, -1.74622, 1.73541, -0.823268, 0.179346],\n/lp_03 : [0.185144, 0.138328, 0.174689, 0.104663, 0.0464384, 1, -1.29824, 1.46341, -0.71065, 0.202884],\n/lp_04 : [0.268096, 0.517442, 0.583992, 0.374865, 0.119939, 1, 0.032461, 0.769452, -0.00714309, 0.0714587],\n/lp_05 : [0.373057, 0.898312, 0.966086, 0.518961, 0.109901, 1, 0.805311, 0.811059, 0.237187, 0.0849292],\n/lp_d_01 : [-0.154317, 0.174239, -0.0178887, -0.00229757, 0.000264354, 1, -2.05749, 1.85871, -0.801785, 0.131076],\n/lp_d_02 : [0.197368, -0.00565674, -0.0321851, -0.109945, -0.0495816, 1, -0.987078, 0.777486, -0.220684, 0.028134],\n/lp_d_03 : [0.271248, 0.132367, -0.0487267, -0.178342, -0.176546, 1, -0.291948, 0.510465, -0.015578, 0.000284],\n/lp_d_04 : [-0.345314, -0.191447, 0.074794, 0.251913, 0.210054, 1, -0.094497, 0.735455, -0.136289, 0.075249],\n/lp_d_05 : [-0.456585, -0.341267, 0.133901, 0.408748, 0.255203, 1, 0.405357, 0.78612, -0.016588, 0.103079],\n/lp_dd_01 : [-0.073899, 0.135162, -0.0512998, -0.00729183, -0.00267183, 1, -1.62829, 1.41876, -0.622342, 0.108528],\n/lp_dd_02 : [-0.0795571, 0.139071, -0.0479193, -0.0031459, -0.00844869, 1, -1.57103, 1.45921, -0.717374, 0.148801],\n/lp_dd_03 : [0.109916, -0.128912, -0.0372667, 0.0216082, 0.0346553, 1, -0.827495, 0.811078, -0.353088, 0.065989],\n/lp_dd_04 : [0.139592, -0.122282, -0.0923903, -0.00674097, 0.0818215, 1, -0.363318, 0.635959, -0.298413, 0.067731],\n/lp_dd_05 : [0.203207, -0.09636, -0.248353, -0.0270427, 0.168549, 1, 0.615841, 0.520733, -0.003834, 0.018098]"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 212.0, 598.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 584.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-17", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "filtergraphBronze",
								"default" : 								{
									"color" : [ 0.010881, 0.909804, 0.896768, 1.0 ],
									"bgcolor" : [ 0.285714, 0.256629, 0.217237, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "ksliderWhite",
								"default" : 								{
									"color" : [ 1.0, 1.0, 1.0, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjBrown-1",
								"default" : 								{
									"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjCyan-1",
								"default" : 								{
									"accentcolor" : [ 0.029546, 0.773327, 0.821113, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjGreen-1",
								"default" : 								{
									"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjRed-1",
								"default" : 								{
									"accentcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"fontsize" : [ 12.059008 ],
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "numberGold-1",
								"default" : 								{
									"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "panelViolet",
								"default" : 								{
									"bgfillcolor" : 									{
										"type" : "color",
										"color" : [ 0.372549, 0.196078, 0.486275, 0.2 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"angle" : 270.0,
										"proportion" : 0.39,
										"autogradient" : 0
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "scope~001",
								"default" : 								{
									"color" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"accentcolor" : [ 0.439216, 0.447059, 0.47451, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 1078.0, 112.999999999999829, 142.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p init-menu"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1078.0, 73.696166999999889, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"items" : [ "/thru", ",", "/lp_01", ",", "/lp_02", ",", "/lp_03", ",", "/lp_04", ",", "/lp_05", ",", "/lp_d_01", ",", "/lp_d_02", ",", "/lp_d_03", ",", "/lp_d_04", ",", "/lp_d_05", ",", "/lp_dd_01", ",", "/lp_dd_02", ",", "/lp_dd_03", ",", "/lp_dd_04", ",", "/lp_dd_05" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1078.0, 151.999999999999829, 74.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 663.666666666666629, 50.696166999999946, 72.0, 22.0 ],
					"text" : "patcherargs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 590.0, 326.999999999999886, 35.0, 20.0 ],
					"text" : "state"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "clear" ],
					"patching_rect" : [ 547.0, 231.999999999999886, 47.0, 22.0 ],
					"text" : "t l clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 198.0, 82.999999999999943, 158.0, 22.0 ],
					"text" : "t l l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 262.0, 819.696167000000059, 99.0, 22.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 198.0, 292.999999999999886, 187.0, 22.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 198.0, 722.696166999999946, 83.0, 22.0 ],
					"text" : "o.select /state"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 198.0, 326.999999999999886, 215.0, 22.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-70",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 198.0, 42.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-72",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 262.0, 865.696167000000059, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-5",
					"linecount" : 23,
					"maxclass" : "o.expr.codebox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 198.0, 374.696166999999946, 795.0, 331.0 ],
					"text" : "/coeffs ??= [-0.456585, -0.341267, 0.133901, 0.408748, 0.255203, -0.405357, -0.78612, 0.016588, -0.103079],\n\n/id ??= aseq(1, length(/addrs[[0]])),\n\n\nmap( \n  lambda([a],\n    assign(\"/out\"+/filtertype+a, \n        map(\n            lambda([id, val],  \n                /tmp/addr = \"/state/\"+id+a,\n                /tmp/state = value(/tmp/addr),\n                /tmp/state ??= nfill(8, 0.0),\n\n                /res = dot([val, /tmp/state ], /coeffs),\n\n                assign(value(/tmp/addr), [val, /tmp/state[[0,1,2]], /res, /tmp/state[[4,5,6]]]  ),\n                /res\n            ), /id, value(a)\n        )\n    )\n  ), /addrs \n)"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"midpoints" : [ 584.5, 312.499999999999886, 403.5, 312.499999999999886 ],
					"order" : 0,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"midpoints" : [ 584.5, 270.499999999999886, 375.5, 270.499999999999886 ],
					"order" : 1,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"midpoints" : [ 207.5, 770.696166999999946, 1036.5, 770.696166999999946, 1036.5, 269.696166999999946, 403.5, 269.696166999999946 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-20", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-51", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-51", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"order" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"order" : 1,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 2 ],
					"order" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"order" : 1,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 2,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"order" : 1,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"order" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 1 ],
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"order" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"order" : 1,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 1 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "o.accum.maxpat",
				"bootpath" : "~/Documents/dev-lib/CNMAT-odot/patchers/namespace",
				"patcherrelativepath" : "../../../CNMAT-odot/patchers/namespace",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.gather.select.maxpat",
				"bootpath" : "~/Documents/dev-lib/CNMAT-odot/patchers/namespace",
				"patcherrelativepath" : "../../../CNMAT-odot/patchers/namespace",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "o.expr.codebox.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.union.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.select.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.compose.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.pack.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.collect.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.if.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.display.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
