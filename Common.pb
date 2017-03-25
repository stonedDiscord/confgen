; PureBasic Visual Designer v3.95 build 1485 (PB4Code)


;- Window Constants
;
Enumeration
  #Window_0
EndEnumeration

;- Gadget Constants
;
Enumeration
  #Button_Save
  #Button_Load
  #Frame3D_0
  #CheckBox_Public
  #Text_0
  #String_oppass
  #Text_1
  #String_port
  #Frame3D_1
  #Text_2
  #String_servername
  #Text_3
  #String_serverdesc
  #CheckBox_musicmode
  #Button_Default
  #CheckBox_replay
  #String_lines
  #Frame3D_2
  #Text_4
  #String_pass
  #Text_5
  #Frame3D_3
  #Listview_chars
  #Button_add
  #Button_remove
  #Text_7
  #String_charname
  #Text_8
  #String_chardesc
  #Text_9
  #String_bg
  #Frame3D_4
  #Text_10
  #String_charpw
  #Text_11
  #String_case
  #Frame3D_5
  #Listview_evi
  #Button_eadd
  #Button_eremove
  #Text_12
  #String_eviname
  #Text_13
  #String_evidesc
  #Text_14
  #String_eviimg
  #Text_15
  #Combo_evitype
  #Button_casedef
  #Button_caseload
  #Button_casesave
  #String_charevi
EndEnumeration


Procedure Open_Window_0()
  If OpenWindow(#Window_0, 163, 210, 450, 510, "stonedDiscord's AO server config editor",  #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_TitleBar )
    If CreateGadgetList(WindowID(#Window_0))
      ButtonGadget(#Button_Save, 240, 0, 90, 30, "Save")
      ButtonGadget(#Button_Load, 160, 0, 70, 30, "Load")
      Frame3DGadget(#Frame3D_0, 10, 30, 140, 110, "Network")
      CheckBoxGadget(#CheckBox_Public, 20, 50, 70, 20, "Public")
      TextGadget(#Text_0, 20, 70, 50, 20, "OP PW:")
      StringGadget(#String_oppass, 60, 70, 80, 20, "", #PB_String_Password)
      TextGadget(#Text_1, 20, 110, 30, 20, "Port")
      StringGadget(#String_port, 50, 110, 90, 20, "", #PB_String_Numeric)
      Frame3DGadget(#Frame3D_1, 160, 30, 280, 110, "Server")
      TextGadget(#Text_2, 170, 50, 40, 20, "Name")
      StringGadget(#String_servername, 230, 50, 200, 20, "")
      TextGadget(#Text_3, 170, 70, 60, 20, "Description")
      StringGadget(#String_serverdesc, 230, 70, 200, 20, "")
      CheckBoxGadget(#CheckBox_musicmode, 170, 90, 80, 20, "Musicmode")
      ButtonGadget(#Button_Default, 80, 0, 70, 30, "Default")
      CheckBoxGadget(#CheckBox_replay, 250, 90, 110, 20, "Save Replay Lines:")
      StringGadget(#String_lines, 360, 90, 70, 20, "")
      Frame3DGadget(#Frame3D_2, 10, 10, 430, 130, "settings.ini")
      TextGadget(#Text_4, 20, 90, 30, 20, "PW:")
      StringGadget(#String_pass, 50, 90, 90, 20, "")
      TextGadget(#Text_5, 170, 110, 40, 20, "Case:")
      Frame3DGadget(#Frame3D_3, 10, 150, 430, 350, "init.ini")
      ListViewGadget(#Listview_chars, 20, 190, 120, 120)
      ButtonGadget(#Button_add, 140, 190, 30, 60, "+")
      ButtonGadget(#Button_remove, 140, 250, 30, 60, "-")
      TextGadget(#Text_7, 180, 200, 40, 20, "Name:")
      StringGadget(#String_charname, 220, 200, 210, 20, "")
      TextGadget(#Text_8, 180, 230, 60, 20, "Description:")
      StringGadget(#String_chardesc, 250, 230, 180, 20, "")
      TextGadget(#Text_9, 20, 330, 70, 20, "Background:")
      StringGadget(#String_bg, 90, 330, 100, 20, "")
      Frame3DGadget(#Frame3D_4, 10, 170, 430, 150, "Characters")
      TextGadget(#Text_10, 180, 260, 60, 20, "Password:")
      StringGadget(#String_charpw, 240, 260, 190, 20, "")
      TextGadget(#Text_11, 180, 290, 50, 20, "Evidence:")
      StringGadget(#String_case, 210, 110, 220, 20, "")
      Frame3DGadget(#Frame3D_5, 10, 360, 430, 140, "Evidence")
      ListViewGadget(#Listview_evi, 20, 380, 120, 100)
      ButtonGadget(#Button_eadd, 140, 380, 30, 50, "+")
      ButtonGadget(#Button_eremove, 140, 430, 30, 50, "-")
      TextGadget(#Text_12, 180, 380, 40, 20, "Name:")
      StringGadget(#String_eviname, 220, 380, 210, 20, "")
      TextGadget(#Text_13, 180, 410, 60, 20, "Description:")
      StringGadget(#String_evidesc, 240, 410, 190, 20, "")
      TextGadget(#Text_14, 180, 440, 40, 20, "Image:")
      StringGadget(#String_eviimg, 220, 440, 210, 20, "")
      TextGadget(#Text_15, 180, 470, 40, 20, "Type:")
      ComboBoxGadget(#Combo_evitype, 220, 470, 210, 20)
      ButtonGadget(#Button_casedef, 210, 330, 70, 30, "Default")
      ButtonGadget(#Button_caseload, 290, 330, 60, 30, "Load")
      ButtonGadget(#Button_casesave, 360, 330, 70, 30, "Save")
      StringGadget(#String_charevi, 240, 290, 190, 20, "")
      
    EndIf
  EndIf
EndProcedure

