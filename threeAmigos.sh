#Sums the first 3 arguments and supplies the sum as the first argument to subtractMachine.sh
#Example invocation: ./threeAmigos.sh 3 5 7 15
#Example result: 15 is equal to 15 , Difference is 0
#!/bin/bash
if [ $# -eq 4 ]
then
Sum=$(($1+$2+$3))
./subtractMachine.sh $Sum $4
else
echo "Invalid Syntax"
echo "Usage: ./threeAmigos.sh (num1) (num2) (num3) (num4)"
fi
