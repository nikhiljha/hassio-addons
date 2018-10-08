#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

# PLAIN=$(jq --raw-output ".plain" $CONFIG_PATH)

exec cp $CONFIG_PATH ~/.config/configstore/ethyl-hass.json

# start server
exec node /etc/ethyl-hass/index.js < /dev/null
