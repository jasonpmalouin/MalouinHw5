#!/bin/bash
#Blink mode requires user to specify number of blinks (1 second on, 1 second off)
#Usage: ./led-hw5.sh blink 5
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash, status, or blink  \n e.g. bashLED blink (n times) "
  exit 2
fi
echo "The LED Command that was passed is: $1"
if [ "$1" == "on" ]; then
  echo "Turning the LED on"
  removeTrigger
  echo "1" >> "$LED3_PATH/brightness"
elif [ "$1" == "off" ]; then
  echo "Turning the LED off"
  removeTrigger
  echo "0" >> "$LED3_PATH/brightness"
elif [ "$1" == "flash" ]; then
  echo "Flashing the LED"
  removeTrigger
  echo "timer" >> "$LED3_PATH/trigger"
  sleep 1
  echo "100" >> "$LED3_PATH/delay_off"
  echo "100" >> "$LED3_PATH/delay_on"
elif [ "$1" == "status" ]; then
  cat "$LED3_PATH/trigger";
elif [ "$1" == "blink" ]; then
  if [ $# -eq 2 ]; then
      removeTrigger
      counter=0
      while [ $counter -lt $2 ]
        do
	  echo "1" >> "$LED3_PATH/brightness"
	  sleep 1
	  echo "0" >> "$LED3_PATH/brightness"
	  echo Blink Count: $((counter+1))
	  sleep 1
	  ((counter++))
        done
  else
 	echo "Wrong number of arguments"
	echo "Usage: ./led-hw5.sh blink (number of blinks)"
  fi
fi
echo "End of the LED Bash Script"
