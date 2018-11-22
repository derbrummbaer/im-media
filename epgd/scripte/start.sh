#!/bin/bash

# Start Script für Container
echo "###################################################"
echo "#### Begin run.sh #################################"
echo "####"
echo "run.sh: Starte Install Script"
echo "####"
/usr/local/bin/install.sh
echo "run.sh: Start my_init"
echo "####"
/sbin/my_init
