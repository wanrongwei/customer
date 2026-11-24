## jdk17
FROM 10.1.248.183:4999/veris_base/centos_jdk17:stream8

RUN rm -fr /home/aidocker/bin/* && \
    rm -fr /home/aidocker/config/*
COPY ./docker/ /home/aidocker/
COPY ./target/customer-starter-*.jar /home/aidocker/app/app-starter.jar
COPY ./docker/init.sh /root/init.sh
RUN chmod 755 /root/init.sh

