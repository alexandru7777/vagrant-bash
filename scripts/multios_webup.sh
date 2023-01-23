#!/bin/bash

##Variable Declaration##############
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2102_constructive.zip"
#Template name model
ART_NAME="2102_constructive"
TEMPDIR="/tmp/webfiles"


yum --help &> /dev/null

if [ $? -eq 0 ]
then
        #Set Variable for CentOS
        PACKAGE="httpd wget unzip"
        SVC="httpd"
        echo "Running Setup on CentOS"
        ##########Installing dep. ############
        echo "#######################"
        echo "Installing dependencies"

        sudo yum install $PACKAGE -y
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        sleep 3
        echo "$SVC service ended"
        echo

        ####Create Temp files#####
        echo "Creating directory and downloading the files... "
        mkdir -p $TEMPDIR
        cd $TEMPDIR
        echo
        #####Download artefact - tooplate
        echo "Downloading artefact"
        wget $URL
        unzip $ART_NAME.zip
        cp -r $ART_NAME/* /var/www/html/
        echo

        ######Restart system afterwards
        systemctl restart $SVC
        echo
        ###Clean them#####
        rm -rf $TEMPDIR
        ls /var/www/html
        echo

else

        #Set Variable for Ubuntu
        PACKAGE="apache2 wget unzip"
        SVC="apache2"
        echo "Running Setup on Ubuntu"
        ##########Installing dep. ############
        echo "#######################"
        echo "Installing dependencies"
        sudo apt update
        sudo apt install $PACKAGE -y
        sudo systemctl start $SVC
        sudo systemctl enable $SVC

        sleep 3
        echo "$SVC service ended"
        echo

        ####Create Temp files#####
        echo "Creating directory and downloading the files... "
        mkdir -p $TEMPDIR
        cd $TEMPDIR
        echo
        #####Download artefact - tooplate
        echo "Downloading artefact"
        wget $URL
        unzip $ART_NAME.zip
        cp -r $ART_NAME/* /var/www/html/
        echo

        ######Restart system afterwards
        systemctl restart $SVC
        echo
        ###Clean them#####
        rm -rf $TEMPDIR
        ls /var/www/html
        echo "Process done"
fi

