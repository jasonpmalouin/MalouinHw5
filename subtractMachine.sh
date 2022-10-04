#Script subtracts smaller argument from the larger argument, then counts down to 1 from result
#Example invocation: ./subtractMachine.sh 5 6
# 6 is greater than 5
# Difference = 1
# Count Down = 1
#!/bin/bash
if [ $# -eq 2 ]
then
if [ $1 -lt $2 ]
then
difference=$(($2-$1))
echo $2 is greater than $1
elif [ $1 -gt $2 ]
then
echo $1 is greater than $2
difference=$(($1-$2))
else
echo $1 is equal to $2
difference=0
fi
echo Difference = $difference

counter=$difference
while [ $counter -gt 0 ]
do
echo Count Down = $counter
((counter--))
done
else
echo "Invalid Syntax"
echo "Usage: ./subtractMachine (number 1) (number 2)"
fi
