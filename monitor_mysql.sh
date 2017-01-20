#!/bin/bash
checkdur=30
rds_h=""
rds_u=""
rds_p=""
sms_u=""
sms_p=""
sms=""

mysqladmin=`which mysqladmin`
curl=`which curl`


while true 
do
s=`$mysqladmin -s  -h $rds_h -u $rds_u -p$rds_p  ping `

if [[ $s == "mysqld is alive" ]] 
then
    echo "rds ok"
    echo "` date "+%Y-%m-%d %H:%M:%S"` rds ok"  >> rds_run_log.txt
else
    echo "rds error"
    error="` date "+%Y-%m-%d %H:%M:%S"` rds error"
    echo  $error >> rds_run_log.txt
    
    ##### sms #####
    
    content="mysql_error_time` date "+%m%d%H%M%S"`"
    $curl -m 5 "http://api.smsbao.com/sms?u=$sms_u&p=$sms_p&m=$sms&c=$content"
fi
    echo "sleep $checkdur"
    sleep $checkdur
done
