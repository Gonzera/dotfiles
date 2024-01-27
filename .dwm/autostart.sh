#!/bin/bash


function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run picom &
run slstatus &
run qbittorrent &
run xbanish &
run rescrobbled &
run "feh --bg-fill $HOME/.wallpapers/misc01.jpg --bg-scale $HOME/.wallpapers/2bit.png --bg-scale $HOME/.wallpapers/2bit.png" &
run "weeb_helper -d" &
run "/opt/urserver/urserver --daemon"
