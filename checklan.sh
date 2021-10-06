#!/bin/bash
# cron script for checking lan connectivity
# Original author https://unix.stackexchange.com/questions/122484/linux-centos-6-restart-network-service-after-lost-ping#122487

# Ping count is set aggressively to 1, increase depending what you want.
PING_COUNT=1
#I'm assuming ping is installed.
PING="/bin/ping"

#Find the gateway IP address
GATEWAY_IP=`ip route | grep default | cut -d " " -f 3`
# ping test
$PING -n -c "$PING_COUNT" "$GATEWAY_IP" &>/dev/null

if [ "$?" -ge 1 ]
then
    # This will log a message in system log (see manpage).
    logger "Network access DOWN"

    service network restart
else
    logger "Network access OK"
fi
