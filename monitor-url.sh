#!/bin/bash
www="http://..."
#we put ok into  a php monitor file 
checkdur=30
while true 
do
s=`curl -s -m  5 "$www"`
if [ $s == "ok" ] 
then
	echo "ok"
	counter=0
	echo $counter
else
	counter=$(($counter+1))
	echo $counter
	
	if [ $counter -gt 3 ]
    then
        echo "restart host"
        #add restart host shell here 
        #/sbin/shutdown -r now 
    fi
	 
    echo "restart web"
    #add restart web shell here 
	
    echo "sleep $checkdur"
    sleep $checkdur
fi
done

