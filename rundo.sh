#!/bin/bash

# needs xdotool and xclip 

#copy to clipboard (primary X selection) "do filename"
echo 'do ' '"'$1'"' | xclip

# get current window id
winedit=`xdotool getwindowfocus`
#winstata=`xdotool search --onlyvisible --name "Stata/SE"`
winstata=`xdotool search --name "Stata/SE"`

## check for stata window, if found activate else execute use correct version here
#if [ "$(pgrep stata)" ] 
#then
#   xdotool windowactivate --sync $winstata
#else
#   ~/local/stata16/xstata-se &
#   sleep 1s 
#fi
#
## delay depends on window manager etc
## .1 ok with xmonad in 10.04
# sleep 0.1

# switch to command line for stata16 does not seems to be necessary
# xdotool key --window $winstata Ctrl+1
# sleep 0.5

# paste filename (full do file or temp do files for lines)
xdotool windowactivate $winstata type --window $winstata "$(xclip -o)"
sleep 0.7
# CR
xdotool key --window $winstata Return

sleep 1 

# go back to editor window
xdotool windowactivate --sync $winedit

