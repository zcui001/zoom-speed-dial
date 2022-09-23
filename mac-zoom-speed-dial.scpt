on list_position(this_item, this_list)
	repeat with i from 1 to the count of this_list
		if item i of this_list is this_item then return i
	end repeat
	return 0
end list_position


set RoomNameList to {}
set RoomIdList to {}
set PasscodeList to {}

#Set up RoomsNames, Ids, and Passcode
set end of RoomNameList to "Room1"
set end of RoomIdList to "111 111 1111"
set end of PasscodeList to "aaaaaa"

set end of RoomNameList to "Room2"
set end of RoomIdList to "222 222 2222"
set end of PasscodeList to "bbbbbb"

set SelectedName to choose from list RoomNameList with prompt "Select which room to join:"
if the SelectedName is false then return
set the SelectedRoomId to item (list_position((SelectedName as string), RoomNameList)) of the RoomIdList
set the SelectedPasscode to item (list_position((SelectedName as string), RoomNameList)) of the PasscodeList


if application "zoom.us" is running then
	tell application "zoom.us" to activate
	delay 1
	tell application "System Events" to ¬
		tell application process "zoom.us"
			keystroke "j" using command down
			delay 1
			
			keystroke SelectedRoomId
			key code 36
			delay 1
			
			keystroke SelectedPasscode
			key code 36
			
		end tell
end if
