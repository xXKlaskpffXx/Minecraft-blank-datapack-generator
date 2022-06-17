#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=d:\developing\minecraft ft. autoit\datapackgen.kxf
$DatapackGen = GUICreate("Raw Datapack generator for MC", 362, 226, 299, 154)
GUISetIcon("D:\Developing\Minecraft ft. AutoIt\DataGen.ico", -1)
GUISetBkColor(0xD6DDEF)
$Path = GUICtrlCreateInput("-Install Path-", 8, 8, 345, 28, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xF4F7FC)
$BrowseBT = GUICtrlCreateButton("Browse...", 8, 40, 105, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xF4F7FC)
$InstallBT = GUICtrlCreateButton("Generate blank Datapack", 8, 168, 345, 49)
GUICtrlSetFont(-1, 18, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xF4F7FC)
GUICtrlSetBkColor(-1, 0x6D6D6D)
$PackFormat = GUICtrlCreateSlider(8, 80, 345, 33)
GUICtrlSetLimit(-1, 10, 4)
GUICtrlSetData(-1, 6)
$Label1 = GUICtrlCreateLabel("1.13 -", 16, 128, 37, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label2 = GUICtrlCreateLabel("1.14.4", 16, 144, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label3 = GUICtrlCreateLabel("1.15 -", 64, 128, 37, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label4 = GUICtrlCreateLabel("1.16.1", 64, 144, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label5 = GUICtrlCreateLabel("1.17 -", 168, 128, 37, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label6 = GUICtrlCreateLabel("1.17.1", 168, 144, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label7 = GUICtrlCreateLabel("1.18 -", 216, 128, 37, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label8 = GUICtrlCreateLabel("1.18.1", 216, 144, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label9 = GUICtrlCreateLabel("1.18.2", 264, 128, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$Label10 = GUICtrlCreateLabel("1.16.2 -", 112, 128, 48, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label11 = GUICtrlCreateLabel("1.16.5", 112, 144, 40, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$Label12 = GUICtrlCreateLabel("1.19", 320, 128, 29, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x808080)
$DName = GUICtrlCreateInput("Datapack Name", 120, 40, 233, 32, BitOR($GUI_SS_DEFAULT_INPUT,$ES_LOWERCASE))
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xF4F7FC)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
    $PFormat = GUICtrlRead($PackFormat)
    $PackName = GUICtrlRead($DName)
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

        Case $BrowseBT
            $Folder = FileSelectFolder("Please select an install folder", "")
            GUICtrlSetData($Path, $Folder)

        Case $InstallBT

            If StringRegExp($PackName, "[^a-z0-9-_.]") Then
                MsgBox(0, "ERROR", "The Datapack name must only contain lowercase letters, numbers, hyphens, underscores and periods")
            Else

                DirCreate(GUICtrlRead($Path) & "\" & $PackName & "\data\minecraft\tags\functions")
                DirCreate(GUICtrlRead($Path) & "\" & $PackName & "\data\" & $PackName & "\functions")
                FileWrite(GUICtrlRead($Path) & "\" & $PackName & "\pack.mcmeta", '{"pack": {"pack_format":' & $PFormat & ',"description": "Datapack Generator by xXKlaskpffXx"}}')
                FileWrite(GUICtrlRead($Path) & "\" & $PackName & "\data\minecraft\tags\functions\load.json", '{"values":["' & $PackName & ':init"]}')
                FileWrite(GUICtrlRead($Path) & "\" & $PackName & "\data\minecraft\tags\functions\tick.json", '{"values":["' & $PackName & ':tick"]}')
                FileWrite(GUICtrlRead($Path) & "\" & $PackName & "\data\" & $PackName & "\functions\init.mcfunction", "")
                FileWrite(GUICtrlRead($Path) & "\" & $PackName & "\data\" & $PackName & "\functions\tick.mcfunction", "")
                $Exit = MsgBox(4, "DONE", "Datapack successfully installed! Do you want to quit the program?")
                If $Exit = 6 Then
                    Exit
                EndIf
            EndIf

    EndSwitch
WEnd
