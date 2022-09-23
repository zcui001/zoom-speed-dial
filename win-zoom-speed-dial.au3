#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <AutoItConstants.au3>
#include <Array.au3>

Func ZoomSpeedDial()
	;find the main zoom window
	Local $hWnd = WinGetHandle( "[CLASS:ZPPTMainFrmWndClassEx]") 
	If $hWnd = 0 then
		MsgBox(0, "Error", "Please start the zoom")
		Exit 
	EndIf 

	;update with your own zoom rooms
	Local $RoomNameList[] = []
	Local $RoomIdList[] = []	
	Local $PasscodeList[] = []

	_ArrayAdd($RoomNameList, "Room1")
	_ArrayAdd($RoomIdList, "111 111 1111")
	_ArrayAdd($PasscodeList, "aaaaaa")	

	_ArrayAdd($RoomNameList, "Room2")
	_ArrayAdd($RoomIdList, "222 222 2222")
	_ArrayAdd($PasscodeList, "bbbbbb")	



	$DropDown = ""
	For $i = 0 To UBound($RoomNameList) - 1
		$DropDown &= "|" & $RoomNameList[$i]
	Next

	; Create a GUI
	$hGUI = GUICreate("Zoom Speed Dial", 300, 200)
	$hCombo = GUICtrlCreateCombo("", 10, 10, 200, 20)
	Local $idButton_Join = GUICtrlCreateButton("Join", 64, 160, 175, 25)
	GUICtrlSetData($hCombo, $DropDown)
	GUISetState()
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
			Case $idButton_Join
				$SelectedName = GUICtrlRead($hCombo)
				ExitLoop
		EndSwitch
	WEnd

	;select a room
	$SelectedRoomId = ""
	$SelectedPasscode = ""
	For $i = 0 To UBound($RoomNameList) - 1
		If $RoomNameList[$i] == $SelectedName then
			$SelectedRoomId = $RoomIdList[$i]
			$SelectedPasscode = $PasscodeList[$i]
			ExitLoop
		EndIf
	Next

	;goto the zoom main window, click 'home' button, then click 'join' button
	WinActivate($hWnd)
	WinMove($hWnd, "Zoom", 200, 200, 976,636)
	MouseClick($MOUSE_CLICK_LEFT, 615, 260, 1)
	Sleep(2000)
	MouseClick($MOUSE_CLICK_LEFT, 550, 460, 1)
	Sleep(2000)

	;find the 'Join Meeting' window
	$hWnd = WinGetHandle( "[CLASS:zWaitHostWndClass]")
	If $hWnd = 0 then
		MsgBox(0, "Error", "Please start the zoom, click the join button, and don't touch anything in the 'Join Meeting' window")
		Exit 
	EndIf 


	WinActivate($hWnd)
	Send($SelectedRoomId)
	Send("{ENTER}")
	Sleep(2000)
	Send($SelectedPasscode)
	Send("{ENTER}")


EndFunc

ZoomSpeedDial()
