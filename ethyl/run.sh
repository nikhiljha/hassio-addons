#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

# PLAIN=$(jq --raw-output ".plain" $CONFIG_PATH)

echo Starting Ethyl Proxy...
mkdir ~/.config || true
mkdir ~/.config/configstore || true
cp $CONFIG_PATH ~/.config/configstore/ethyl-hass.json || true

# start server
PARENT="http://`/sbin/ip route|awk '/default/ { print $3 }'`"
exec node /etc/ethyl-hass/index.js --hass_addr $PARENT < /dev/null
