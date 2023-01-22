# zoom-speed-dial

## What is this?
A tool to help you join Zoom meetings quickly without typing the room id/passcode each time.

## How does it work?
1. You first define a list of Zoom rooms with Room names/id/passcode in the script.
2. Then You start the Zoom application, and run the script. On Windows/macOS, it will show a dialog to you to select the room name to join. On Linux, you run the script with the room name to join as the input argument.
3. Then it will send keyboard/mouse events to the Zoom window to join the Zoom room. 

## How to use it?

- Windows

  1. Install [Autoit](https://www.autoitscript.com/site/).
  2. Edit win-zoom-speed-dial.au3 to replace variables RoomNameList/RoomIdList/PasscodeList with your own Zoom rooms information.
  3. Start the Zoom application and run the script win-zoom-speed-dial.au3. 
  
- macOS

  1. Edit mac-zoom-speed-dial.scpt to replace variables RoomNameList/RoomIdList/PasscodeList with your own Zoom rooms information.
  2. Start the Zoom application and run the script mac-zoom-speed-dial.scpt. 

- Linux

  1. Install xdotool.
  2. Edit linux-zoom-speed-dial.sh to replace variables ZoomId/ZoomPass with your own Zoom rooms information.
  3. Start the Zoom application and run the script linux-zoom-speed-dial.sh with the room name to join as the input argument. 
