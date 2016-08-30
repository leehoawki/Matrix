#!/bin/bash
width=250
flips=5
sleep=0.05

for (( i = 0; i < $width; i++ ));do
switches[$i]=1
done

garbage="1234567890!@#$%^&*()ZXCVBNM<>?"
l=${#garbage}

while [ 1 ]
do
for (( i = 0; i< $flips; i++ ));do
     x=$[$RANDOM%$[$width-1]]
     if [ ${switches[$x]} = 1 ];then
          switches[$x]=0
     else
          switches[$x]=1
     fi
done

sleep $sleep

for (( i = 0; i < $width; i++ ));do           
     if [ ${switches[$i]} = 1 ];then
          echo -n "${garbage:$[$RANDOM%$[$l-1]]:1}"
     else
          echo -n ' '
     fi    
done
echo
done

