#!/usr/bin/env bash 

declare -A ZoomId  #ZoomId
declare -A ZoomPass #ZoomPassword

ZoomId['Room1']='111 111 1111'
ZoomPass['Room1']='aaaaaa' 

ZoomId['Room2']='222 222 2222'
ZoomPass['Room2']='bbbbbb'

print_zoom_rooms() {
    for key in "${!ZoomId[@]}"; do
        echo "$key: ZoomId=\"${ZoomId[$key]}\", ZoomPass=\"${ZoomPass[$key]}\" "
    done
}

#Handle input
if [ $# -eq 0 ]
then
    echo "usage: $0 <room_name>"
    echo ""
    echo "valid room names:"
    print_zoom_rooms
    exit 1
fi

if [ ! -v ZoomId[$1] ]; then
    echo "$1 is not set up in ZoomId"
    exit 1
else
    InputZoomId=${ZoomId[$1]}
fi

if [ ! -v ZoomPass[$1] ]; then
    echo "$1 is not set up in ZoomPass"
    exit 1
else
    InputZoomPass=${ZoomPass[$1]}
fi

#Find Zoom main window and move to predefine the position/size
#Replace with your own Zoom main window title if it's not same with below
zoom_main_win_hdl=$(xdotool search --name 'Zoom - Licensed Account') 
xdotool windowmove ${zoom_main_win_hdl} 200 200
xdotool windowsize ${zoom_main_win_hdl} 100 100

#Click 'Home'
xdotool windowactivate ${zoom_main_win_hdl}
xdotool mousemove   280 220
sleep 0.5
xdotool click 1

#Click 'Join'
xdotool mousemove   460 420
sleep 0.5
xdotool click 1
sleep 1

#Input the Zoom Id and Password
zoom_join_win_hdl=$(xdotool getactivewindow)
xdotool windowmove ${zoom_join_win_hdl} 600 200
xdotool windowsize ${zoom_join_win_hdl} 100 100
xdotool mousemove   650 310
sleep 0.5
xdotool click 1
sleep 0.5
xdotool type --window ${zoom_join_win_hdl} $InputZoomId
xdotool key --window ${zoom_join_win_hdl} KP_Enter
sleep 0.5
xdotool type $InputZoomPass
xdotool key KP_Enter

