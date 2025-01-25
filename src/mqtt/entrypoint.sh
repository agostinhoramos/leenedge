#!/bin/bash

# Wait for the FIFO file to become available
while [ ! -p /tmp/dlt ]; do
    sleep 1
done

# Start the MQTT broker
/usr/sbin/mosquitto -c /etc/mosquitto/conf.d/default.conf