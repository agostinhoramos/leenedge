FROM ubuntu:20.04

LABEL release-date="2023-04-10" maintainer="Agostinho Ramos <agostinhopina095@gmail.com>"

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mosquitto \
    net-tools ufw sudo openssl dos2unix

RUN mkdir /usr/src/mosquitto

COPY src/mqtt/setup /usr/src/mosquitto

RUN mkfifo /tmp/dlt

RUN chmod +x /usr/src/mosquitto/setup

RUN dos2unix /usr/src/mosquitto/setup

RUN /bin/bash /usr/src/mosquitto/setup

COPY ssl /etc/mosquitto/ca_certificates/

RUN touch /var/log/mosquitto/mosquitto.log

RUN chmod 777 -R /var/log/mosquitto

COPY src/mqtt/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 22 1883 8883 8083

ENTRYPOINT ["/entrypoint.sh"]