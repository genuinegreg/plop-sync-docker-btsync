#!/bin/bash


DB_HOST=${DB_HOST:-localhost}
DB_NAME=${DB_NAME:-plop-sync-logs}
DB_PORT=${DB_PORT:-27017}
DB_COLLECTION=${DB_COLLECTION:-logs}

sed -i s/##DB_HOST##/$DB_HOST/ /etc/td-agent/td-agent.conf
sed -i s/##DB_NAME##/$DB_NAME/ /etc/td-agent/td-agent.conf
sed -i s/##DB_PORT##/$DB_PORT/ /etc/td-agent/td-agent.conf
sed -i s/##DB_COLLECTION##/$DB_COLLECTION/ /etc/td-agent/td-agent.conf


# monitor bandwith 
/btsync.sh &
td-agent