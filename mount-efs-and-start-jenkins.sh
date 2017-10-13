#!/bin/bash
echo "Starting the mount script"
set -e

CURRENT_USER=`whoami`
JENKINS_USER=$1
echo "Current User is $CURRENT_USER"
echo "Jenkins User is $JENKINS_USER"
echo "Trying to mount..."
mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-9303a15a.efs.eu-west-1.amazonaws.com:/ $JENKINS_HOME
chown -R $JENKINS_USER "$JENKINS_HOME" /usr/share/jenkins/ref
echo "Mounted."
echo "Running jenkins..."
sudo -u $USER /usr/local/bin/jenkins.sh
