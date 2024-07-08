#!/bin/bash

# by: bjorn.graabek@crowdstrike.com

ipmihost=idrac.example.com
logscaleUrl=https://cloud.humio.com
INGEST_TOKEN=XYZ

# ipmi-sensors documentation
# https://www.gnu.org/software/freeipmi/manpages/man8/ipmi-sensors.8.html

/usr/sbin/ipmi-sensors -h $ipmihost -u root -p calvin -D LAN2_0 -t Current,Fan,Temperature,Battery --ignore-not-available-sensors --output-sensor-state --comma-separated-output --no-header-output | \
while read line; do \
  /usr/bin/curl $logscaleUrl/api/v1/ingest/hec/raw -X POST -H "Content-Type: text/plain; charset=utf-8" -H "Authorization: Bearer $INGEST_TOKEN" --data "$ipmihost,$line"; \
done
