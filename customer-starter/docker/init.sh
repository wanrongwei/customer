#!/bin/sh

/usr/sbin/sshd

ENV_INFO=$1
tar -zxvf /home/aidocker/java.tar.gz -C /home/aidocker
rm -f /home/aidocker/java.tar.gz
rm -f /home/aidocker/init.sh

chown -R aidocker:aidocker /home/aidocker
chmod -R 755 /home/aidocker

su - aidocker -c "source /home/aidocker/.cshrc;cd /home/aidocker/bin/&&./start.sh ${ENV_INFO}"

while [ 1 ]
do
  sleep 3600
done
