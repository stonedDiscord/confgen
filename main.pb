; PureBasic Visual Designer v3.95 build 1485 (PB4Code)

Structure Evidence
  type.w
  name.s
  desc.s
  image.s
EndStructure

Global Dim Evidences.Evidence(100)

Structure ACharacter
  name.s
  desc.s
  evinumber.w
  evidence.s
  pw.s
EndStructure

Global Dim Characters.ACharacter(100)
Global CharNumber
Global EviNumber
Global lastS$
Global lastC$
IncludeFile "Common.pb"


Procedure RefreshChars()
  ClearGadgetItems(#Listview_chars)
  For c=0 To CharNumber
    AddGadgetItem(#Listview_chars,c,Characters(c)\name)
  Next
EndProcedure

Procedure RefreshEvi()
  ClearGadgetItems(#Listview_evi)
  For e=0 To EviNumber-1
    AddGadgetItem(#Listview_evi,e,Evidences(e+1)\name)
  Next
EndProcedure

Procedure DefaultSettings()
  SetGadgetState(#CheckBox_Public,1)
  SetGadgetText(#String_oppass,"")
  SetGadgetText(#String_pass,"")
  SetGadgetText(#String_port,"27015")
  SetGadgetText(#String_servername,"Derp server")
  SetGadgetText(#String_serverdesc,"BRO $n DO YOU EVEN RIFT? ")
  SetGadgetState(#CheckBox_musicmode,1)
  SetGadgetState(#CheckBox_replay,1)
  SetGadgetText(#String_lines,"400")
  SetGadgetText(#String_case,"AAOPublic2")
EndProcedure

Procedure LoadCase(lastC$)  
  If OpenPreferences(lastC$)
    PreferenceGroup("global")
    EviNumber=ReadPreferenceInteger("EviNumber",0)
    SetGadgetText(#String_bg,ReadPreferenceString("background","gs4"))
    PreferenceGroup("chars")
    CharNumber=ReadPreferenceInteger("number",19)
    For c=0 To 100
      Characters(c)\name = ReadPreferenceString(Str(c),"")
    Next
    PreferenceGroup("desc")
    For d=0 To 100
      Characters(d)\desc = ReadPreferenceString(Str(d),"")
    Next    
    For e=1 To 100
      PreferenceGroup("evi"+Str(e))
      Evidences(e)\name=ReadPreferenceString("name","")
      Evidences(e)\desc=ReadPreferenceString("desc","")
      Evidences(e)\image=ReadPreferenceString("image","")
      Evidences(e)\type=ReadPreferenceInteger("type",1)
    Next
    ClosePreferences()
    
    For c=0 To 100
      If OpenPreferences(Left(lastC$,Len(lastC$)-8)+"char"+Str(c)+".ini")
        PreferenceGroup("desc")
        If Characters(c)\desc=""
          Characters(c)\desc=ReadPreferenceString("text","")
        EndIf
        Characters(c)\evinumber=ReadPreferenceInteger("evinumber",0)
        Characters(c)\evidence=ReadPreferenceString("evi","")
        Characters(c)\pw=ReadPreferenceString("pass","")
        ClosePreferences()
      EndIf
    Next
    
    RefreshChars()
    RefreshEvi()
  Else    
    MessageRequester("confgen","error reading file",#MB_ICONERROR)
  EndIf
  
EndProcedure

Procedure LoadSettings()
  lastS$=OpenFileRequester("confgen",lastS$,"settings.ini",0)
  If OpenPreferences(lastS$)
    PreferenceGroup("net")
    SetGadgetState(#CheckBox_Public,ReadPreferenceInteger("public",1))
    SetGadgetText(#String_oppass,ReadPreferenceString("oppassword",""))
    SetGadgetText(#String_pass,ReadPreferenceString("password",""))
    SetGadgetText(#String_port,ReadPreferenceString("port","27015"))
    PreferenceGroup("server")
    SetGadgetText(#String_servername,ReadPreferenceString("name","Derp Server"))
    SetGadgetText(#String_serverdesc,ReadPreferenceString("desc","BRO $n DO YOU EVEN RIFT? "))
    SetGadgetState(#CheckBox_musicmode,ReadPreferenceInteger("musicmode",1))
    SetGadgetState(#CheckBox_replay,ReadPreferenceInteger("replaysave",1))
    SetGadgetText(#String_lines,ReadPreferenceString("replaylines","400"))
    SetGadgetText(#String_case,ReadPreferenceString("case","AAOPublic2"))
  Else
    MessageRequester("confgen","error reading file",#MB_ICONERROR)
  EndIf
  ClosePreferences()
  If GetGadgetText(#String_case)<>""
    LoadCase(GetPathPart(lastS$)+"scene\"+GetGadgetText(#String_case)+"\init.ini")
  EndIf
EndProcedure

Procedure SaveSettings()
  lastS$=SaveFileRequester("confgen",lastS$,"settings.ini",0)
  OpenPreferences(lastS$)
  PreferenceGroup("net")
  WritePreferenceInteger("public",GetGadgetState(#CheckBox_Public) )
  WritePreferenceString("oppassword",GetGadgetText(#String_oppass) )
  WritePreferenceString("password",GetGadgetText(#String_pass) )
  WritePreferenceString("port",GetGadgetText(#String_port) )
  PreferenceGroup("server")
  WritePreferenceString("name",GetGadgetText(#String_servername)) 
  WritePreferenceString("desc",GetGadgetText(#String_serverdesc) )
  WritePreferenceInteger("musicmode",GetGadgetState(#CheckBox_musicmode) )
  WritePreferenceInteger("replaysave",GetGadgetState(#CheckBox_replay) )
  WritePreferenceString("replaylines",GetGadgetText(#String_lines)) 
  WritePreferenceString("case",GetGadgetText(#String_case) )
  ClosePreferences()
  CreateDirectory(GetPathPart(lastS$)+"scene")
  CreateDirectory(GetPathPart(lastS$)+"scene\"+GetGadgetText(#String_case))
EndProcedure

Procedure DefaultCase()
  CharNumber=19
  Characters(0)\name="Phoenix"
  Characters(0)\desc="Deffence attorney!"
  Characters(0)\pw=""
  Characters(0)\evidence="1,3,"
  Characters(0)\evinumber=0  
  Characters(1)\name="Miles"
  Characters(1)\desc="Prosecutor!"
  Characters(1)\pw=""
  Characters(1)\evidence="2,4,"
  Characters(1)\evinumber=0
  Characters(2)\name="Judge"
  Characters(2)\desc="blah blah balh"
  Characters(2)\pw=""
  Characters(2)\evidence="5,6,"
  Characters(2)\evinumber=0
  Characters(3)\name="Gumshoe"
  Characters(3)\desc="Too lazy to describe"
  Characters(3)\pw=""
  Characters(3)\evidence="1,2,3,4,5,6,"
  Characters(3)\evinumber=0
  Characters(4)\name="Layton"
  Characters(4)\desc="Who is this?"
  Characters(4)\pw=""
  Characters(4)\evidence=""
  Characters(4)\evinumber=0
  Characters(5)\name="Kristoph"
  Characters(5)\desc="blah blah"
  Characters(5)\pw=""
  Characters(5)\evidence=""
  Characters(5)\evinumber=0
  Characters(6)\name="Mia"
  Characters(6)\desc="Oh rly?"
  Characters(6)\pw=""
  Characters(6)\evidence=""
  Characters(6)\evinumber=0
  Characters(7)\name="Hawk"
  Characters(7)\desc="Matt = Mott"
  Characters(7)\pw=""
  Characters(7)\evidence=""
  Characters(7)\evinumber=0
  Characters(8)\name="Adrian"
  Characters(8)\desc=""
  Characters(8)\pw=""
  Characters(8)\evidence=""
  Characters(8)\evinumber=0
  Characters(9)\name="Armstrong"
  Characters(9)\desc=""
  Characters(9)\pw=""
  Characters(9)\evidence=""
  Characters(9)\evinumber=0
  Characters(10)\name="Butz"
  Characters(10)\desc=""
  Characters(10)\pw=""
  Characters(10)\evidence=""
  Characters(10)\evinumber=0
  Characters(11)\name="Atmey"
  Characters(11)\desc=""
  Characters(10)\pw=""
  Characters(10)\evidence=""
  Characters(10)\evinumber=0
  Characters(12)\name="Lotta"
  Characters(12)\desc=""
  Characters(12)\pw=""
  Characters(12)\evidence=""
  Characters(12)\evinumber=0
  Characters(13)\name="Gant"
  Characters(13)\desc=""
  Characters(13)\pw=""
  Characters(13)\evidence=""
  Characters(13)\evinumber=0
  Characters(14)\name="Godot"
  Characters(14)\desc=""
  Characters(14)\pw=""
  Characters(14)\evidence=""
  Characters(14)\evinumber=0
  Characters(15)\name="Lana"
  Characters(15)\desc=""
  Characters(15)\pw=""
  Characters(15)\evidence=""
  Characters(15)\evinumber=0
  Characters(16)\name="Marshall"
  Characters(16)\desc=""
  Characters(16)\pw=""
  Characters(16)\evidence=""
  Characters(16)\evinumber=0
  Characters(17)\name="Apollo"
  Characters(17)\desc=""
  Characters(17)\pw=""
  Characters(17)\evidence=""
  Characters(17)\evinumber=0
  Characters(18)\name="Matt"
  Characters(18)\desc=""
  Characters(18)\pw=""
  Characters(18)\evidence=""
  Characters(18)\evinumber=0
  Characters(19)\name="Trixie"
  Characters(19)\desc=""
  Characters(19)\pw=""
  Characters(19)\evidence=""
  Characters(19)\evinumber=0
  RefreshChars()
  EviNumber=6
  Evidences(1)\type=1
  Evidences(1)\name="Fingerprints"
  Evidences(1)\desc="fingerprints of Northern driving dogs. The data left in the doorway of the incognito of Phoenix. Neighbors claimed to have seen her images in children's advertising of chocolate"
  Evidences(1)\image="1.gif"
  
  
  Evidences(2)\type=1
  Evidences(2)\name="The play"
  Evidences(2)\desc="An autobiographical play by Miles"
  Evidences(2)\image="2.png"
  
  
  Evidences(3)\type=1
  Evidences(3)\name="Chocolate Sheriff badge."
  Evidences(3)\desc="A few years ago was used as a filler for Shuriken, but was later buried. internal cavity contains typos fingers Wolf."
  Evidences(3)\image="3.png"
  
  
  Evidences(4)\type=1
  Evidences(4)\name="Metal detector"
  Evidences(4)\desc="Once an expensive Japanese metal detector now rusty, because was used as a fishing rod."
  Evidences(4)\image="4.png"
  
  
  Evidences(5)\type=1
  Evidences(5)\name="Scarecrow road dogs."
  Evidences(5)\desc="a fighting breed on the back are cuts; There may also be your hook"
  Evidences(5)\image="5.gif"
  
  
  Evidences(6)\type=1
  Evidences(6)\name="Identity card"
  Evidences(6)\desc="Belongs to the judge, found near the docks, next to a red wig"
  Evidences(6)\image="6.gif"
  RefreshEvi()
  
  SetGadgetText(#String_bg,"gs4") 
  
  
EndProcedure

Procedure SaveCase()
  lastC$=SaveFileRequester("confgen",lastC$,"init.ini",0)
  OpenPreferences(lastC$)
  PreferenceGroup("global")
  WritePreferenceInteger("EviNumber",EviNumber)
  WritePreferenceString("background",GetGadgetText(#String_bg))
  PreferenceGroup("chars")
  WritePreferenceInteger("number",CharNumber)    
  For c=0 To 100
    If Characters(c)\name<>""
      WritePreferenceString(Str(c),Characters(c)\name)
    EndIf
  Next
  PreferenceGroup("desc")
  For d=0 To 100
    If Characters(d)\desc<>""
      WritePreferenceString(Str(d),Characters(d)\desc)
    EndIf
  Next    
  For e=1 To 100
    If Evidences(e)\name<>""
      PreferenceGroup("evi"+Str(e))
      WritePreferenceString("name",Evidences(e)\name)
      WritePreferenceString("desc",Evidences(e)\desc)
      WritePreferenceString("image",Evidences(e)\image)
      WritePreferenceInteger("type",Evidences(e)\type)
    EndIf
  Next  
  ClosePreferences()
  
  For cs=0 To CharNumber
    If Characters(cs)\pw<>"" Or Characters(cs)\evidence<>""
      OpenPreferences(Left(lastC$,Len(lastC$)-8)+"char"+Str(cs)+".ini")
      PreferenceGroup("desc")
      WritePreferenceString("pass",Characters(cs)\pw)
      WritePreferenceString("evi",Characters(cs)\evidence)
      WritePreferenceInteger("evinumber",Characters(cs)\evinumber)
      ClosePreferences()
    EndIf
  Next  
  
  
EndProcedure



Open_Window_0()
AddGadgetItem(#Combo_evitype,0,"Normal")
AddGadgetItem(#Combo_evitype,1,"Photo")
DisableGadget(#String_pass,1)
Repeat ; Start of the event loop
  
  Event = WaitWindowEvent() ; This line waits until an event is received from Windows
  
  WindowID = EventWindow() ; The Window where the event is generated, can be used in the gadget procedures
  
  GadgetID = EventGadget() ; Is it a gadget event?
  
  EventType = EventType() ; The event type
  
  ;You can place code here, and use the result as parameters for the procedures
  
  If Event = #PB_Event_Gadget
    
    If GadgetID = #Button_Save
      SaveSettings()
    ElseIf GadgetID = #Button_Load
      LoadSettings()
    ElseIf GadgetID = #Button_Default
      DefaultSettings()      
    ElseIf GadgetID = #Listview_chars
      Debug CChar
      CChar =GetGadgetState(#Listview_chars)
      If CChar<>-1
        Debug "does this even"        
        SetGadgetText(#String_charname,Characters(CChar)\name)
        SetGadgetText(#String_chardesc,Characters(CChar)\desc)
        SetGadgetText(#String_charpw,Characters(CChar)\pw)
        SetGadgetText(#String_charevi,Characters(CChar)\evidence)
      EndIf
    ElseIf GadgetID = #Button_add And CharNumber<100
      CharNumber+1
      RefreshChars()
    ElseIf GadgetID = #Button_remove And CharNumber>1
      CharNumber-1
      RefreshChars()
    ElseIf GadgetID = #String_charname
      Characters(CChar)\name=GetGadgetText(#String_charname)
      Characters(CChar)\desc=GetGadgetText(#String_chardesc)
      Characters(CChar)\pw=GetGadgetText(#String_charpw)
      Characters(CChar)\evidence=GetGadgetText(#String_charevi)
    ElseIf GadgetID = #String_chardesc
      Characters(CChar)\name=GetGadgetText(#String_charname)
      Characters(CChar)\desc=GetGadgetText(#String_chardesc)
      Characters(CChar)\pw=GetGadgetText(#String_charpw)
      Characters(CChar)\evidence=GetGadgetText(#String_charevi)
    ElseIf GadgetID = #String_charpw
      Characters(CChar)\name=GetGadgetText(#String_charname)
      Characters(CChar)\desc=GetGadgetText(#String_chardesc)
      Characters(CChar)\pw=GetGadgetText(#String_charpw)
      Characters(CChar)\evidence=GetGadgetText(#String_charevi)
    ElseIf GadgetID = #String_charevi
      Debug CChar
      Debug GetGadgetText(#String_charname)
      Characters(CChar)\name=GetGadgetText(#String_charname)
      Characters(CChar)\desc=GetGadgetText(#String_chardesc)
      Characters(CChar)\pw=GetGadgetText(#String_charpw)
      Characters(CChar)\evidence=GetGadgetText(#String_charevi)
    ElseIf GadgetID = #Listview_evi
      CEvi = GetGadgetState(#Listview_evi)+1
      If CEvi<>-1
        SetGadgetText(#String_eviname,Evidences(CEvi)\name)
        SetGadgetText(#String_evidesc,Evidences(CEvi)\desc)
        SetGadgetText(#String_eviimg,Evidences(CEvi)\image)
        SetGadgetState(#Combo_evitype,Evidences(CEvi)\type-1)
      EndIf
    ElseIf GadgetID = #Button_eadd And EviNumber<100
      EviNumber+1
      RefreshEvi()
    ElseIf GadgetID = #Button_eremove And Evidences>0
      EviNumber-1
      RefreshEvi()
    ElseIf GadgetID = #String_eviname
      Evidences(CEvi)\name=GetGadgetText(#String_eviname)
      Evidences(CEvi)\desc=GetGadgetText(#String_evidesc)
      Evidences(CEvi)\image=GetGadgetText(#String_eviimg)
      Evidences(CEvi)\type=GetGadgetState(#Combo_evitype)+1
    ElseIf GadgetID = #String_evidesc
      Evidences(CEvi)\name=GetGadgetText(#String_eviname)
      Evidences(CEvi)\desc=GetGadgetText(#String_evidesc)
      Evidences(CEvi)\image=GetGadgetText(#String_eviimg)
      Evidences(CEvi)\type=GetGadgetState(#Combo_evitype)+1
    ElseIf GadgetID = #String_eviimg
      Evidences(CEvi)\name=GetGadgetText(#String_eviname)
      Evidences(CEvi)\desc=GetGadgetText(#String_evidesc)
      Evidences(CEvi)\image=GetGadgetText(#String_eviimg)
      Evidences(CEvi)\type=GetGadgetState(#Combo_evitype)+1
    ElseIf GadgetID = #Combo_evitype
      Evidences(CEvi)\name=GetGadgetText(#String_eviname)
      Evidences(CEvi)\desc=GetGadgetText(#String_evidesc)
      Evidences(CEvi)\image=GetGadgetText(#String_eviimg)
      Evidences(CEvi)\type=GetGadgetState(#Combo_evitype)+1
    ElseIf GadgetID = #Button_casedef
      DefaultCase()
    ElseIf GadgetID = #Button_caseload
      lastC$=OpenFileRequester("confgen",lastC$,"init.ini",0)
      LoadCase(lastC$)
    ElseIf GadgetID = #Button_casesave
      SaveCase()
    EndIf
    
  EndIf
  
Until Event = #PB_Event_CloseWindow ; End of the event loop

End
;

; IDE Options = PureBasic 5.11 (Windows - x86)
; CursorPosition = 428
; FirstLine = 403
; Folding = ----
; EnableXP
; EnableCompileCount = 0
; EnableBuildCount = 0