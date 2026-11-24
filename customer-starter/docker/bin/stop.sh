#! /bin/sh

SERVER_NAME="cm-server"

PID=$(ps -ef | grep "${SERVER_NAME}" | grep -v grep | awk '{ print $2 }')
if [[ -z "$PID" ]]
then
    echo ${SERVER_NAME} is already stopped
else
    echo kill  ${PID}
    kill -9 ${PID}
    echo ${SERVER_NAME} stopped successfully
fi
