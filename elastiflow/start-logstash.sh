#!/usr/bin/env bash

sudo docker run \
  --detach \
  --name logstash \
  --network=host \
  --restart=always \
  -p 2055:2055 \
  -p 6343:6343 \
  -p 4739:4739 \
  --volume=$(pwd)/conf/ipfix.yml:/etc/logstash/elastiflow/definitions/ipfix.yml:ro \
  --env LS_JAVA_OPTS="-Xms4g -Xmx4g" \
  --env ELASTIFLOW_DEFAULT_APPID_SRCTYPE="__UNKNOWN" \
  --env ELASTIFLOW_RESOLVE_IP2HOST="true" \
  --env ELASTIFLOW_NAMESERVER="${DNS_IP}" \
  --env ELASTIFLOW_NETFLOW_IPV4_PORT="2055" \
  --env ELASTIFLOW_SFLOW_IPV4_PORT="6343" \
  --env ELASTIFLOW_IPFIX_TCP_IPV4_PORT="4739" \
  --env ELASTIFLOW_IPFIX_UDP_IPV4_PORT="4739" \
  # --env ELASTIFLOW_ES_SSL_ENABLE=true \
  # --env ELASTIFLOW_ES_SSL_VERIFY=false \
  # --env ELASTIFLOW_ES_USER="elastic" \
  # --env ELASTIFLOW_ES_PASSWD="pensando" \
  --env ELASTIFLOW_ES_HOST="https://elasticsearch-dmz.pensando.dev:9200" \
  robcowart/elastiflow-logstash-oss:4.0.0-beta
