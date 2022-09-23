# zoom-speed-dial

## What is this?
A tool to help you join Zoom meetings quickly without typing the room id/passcode.

## How does it work?
1. You first define a list of Zoom rooms with Room names/id/passcode in the script.
2. Then You start the Zoom application, and run the script. It will show a dialog to you to select the Room name to join.
3. Then it will send keyboard/mouse events to the Zoom window to join the Zoom room. 

## How to use it?

- Windows

  1. Install [Autoit](https://www.autoitscript.com/site/)
  2. Change win-zoom-speed-dial.au3 to add your Zoom rooms information. Look for RoomNameList/RoomIdList/PasscodeList.
  3. Start the Zoom application and run the script. 
  
- macOS

  1. Change mac-zoom-speed-dial.scpt to add your Zoom rooms information. Look for RoomNameList/RoomIdList/PasscodeList.
  2. Start the Zoom application and run the script. 
