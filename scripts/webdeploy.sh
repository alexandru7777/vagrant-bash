#!/bin/bash

USR="devops"

for host in `cat remote_host`
do
        echo "#############################"
        echo "Connecting to $host"
        scp multios_webup.sh $USR@$host:/tmp/
        #Pushing script and executing
        ssh $USR@$host sudo /tmp/multios_webup.sh
        ssh $USR@$host sudo rm -rf /tmp/multios_webup.sh
        echo "process done and script removed"
        echo "##############################"
done

