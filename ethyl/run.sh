#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

PLAIN=$(jq --raw-output ".plain" $CONFIG_PATH)
PLAIN_WS=$(jq --raw-output ".plain_websockets" $CONFIG_PATH)
SSL=$(jq --raw-output ".ssl" $CONFIG_PATH)
SSL_WS=$(jq --raw-output ".ssl_websockets" $CONFIG_PATH)
LOGINS=$(jq --raw-output ".logins | length" $CONFIG_PATH)
ANONYMOUS=$(jq --raw-output ".anonymous" $CONFIG_PATH)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_PATH)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_PATH)
CUSTOMIZE_ACTIVE=$(jq --raw-output ".customize.active" $CONFIG_PATH)

PLAIN_CONFIG="
listener 1883
protocol mqtt
"

PLAIN_WS_CONFIG="
listener 1884
protocol websockets
"

SSL_CONFIG="
listener 8883
protocol mqtt
cafile /ssl/$CERTFILE
certfile /ssl/$CERTFILE
keyfile /ssl/$KEYFILE
"

SSL_WS_CONFIG="
listener 8884
protocol websockets
cafile /ssl/$CERTFILE
certfile /ssl/$CERTFILE
keyfile /ssl/$KEYFILE
"

# start server
exec node /etc/ethyl-hass/index.js < /dev/null
