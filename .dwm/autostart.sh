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
run "feh --bg-fill $HOME/.wallpapers/lwa01.jpg --bg-scale $HOME/.wallpapers/lwa02.png" &
run "/opt/urserver/urserver --daemon"
