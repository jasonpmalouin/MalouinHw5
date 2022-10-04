#Program will turn LED 3 on for 1 sec , then off, then read the status, then flash for 2 seconds , and finally blink the led 3 times
#Usage: ./commanderBash.sh
#!/bin/bash

if [ $# -eq 0 ]
then
./led-hw5.sh on
echo "-----LED Turned On-----"
sleep 1
./led-hw5.sh off
echo "-----LED Turned Off-----"
sleep 1
./led-hw5.sh status
echo "-----Showing LED Status-----"
./led-hw5.sh flash
echo "------Flashing LED-----"
sleep 2
./led-hw5.sh blink 3
echo "-----Blinking LED 3 Times-----"
else
 echo "Invalid syntax. This program takes no arguments"
fi
