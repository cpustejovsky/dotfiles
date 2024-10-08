#! /usr/bin/bash

ps cax | grep -i polybar
if [ $? -eq 0 ]; then
    killall polybar
else
  if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      MONITOR=$m polybar --reload toph &
    done
  else
    polybar --reload toph &
  fi
fi

