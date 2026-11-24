#! /bin/sh

SERVER_NAME="cm-server"
JAVA_OPT="-server -Xms512m -Xmx1024m -Xmn512m -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=256m"
JAVA_OPT="${JAVA_OPT} -XX:-OmitStackTraceInFastThrow -Dserver.name=${SERVER_NAME}"

# ========== 添加 SkyWalking Agent 配置 ==========
SKYWALKING_AGENT_PATH="/home/aidocker/share/skywalking-agent.jar"
if [ -f "${SKYWALKING_AGENT_PATH}" ]; then
    echo "SkyWalking Agent found: ${SKYWALKING_AGENT_PATH}"
    JAVA_OPT="${JAVA_OPT} -javaagent:${SKYWALKING_AGENT_PATH}"
    JAVA_OPT="${JAVA_OPT} -Dskywalking.agent.service_name=${SERVER_NAME}"
else
    echo "Warning: SkyWalking Agent not found at ${SKYWALKING_AGENT_PATH}, starting without agent"
fi

if [ "$1" == "" ];then
    echo "Please enter environment information, such as: [dev test pro, etc.]"
    exit 0;
fi

ENV_INFO=$1
PID=$(ps -ef | grep "${SERVER_NAME}" | grep -v grep | awk '{ print $2 }')
if [[ -n "$PID" ]]
then
    echo "${SERVER_NAME} is already start"
    exit 0;
fi

nohup java ${JAVA_OPT} -jar ${HOME}/app/app-starter.jar --jasypt.encryptor.password=${JASYPT_PASSWORD} --spring.config.additional-location=${HOME}/config/  --spring.profiles.active=${ENV_INFO} --logging.config=${HOME}/config/logback-spring.xml >> /dev/null 2>&1 &

echo "Start $SERVER_NAME Successfully"
exit 0
