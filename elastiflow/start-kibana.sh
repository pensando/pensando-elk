#!/usr/bin/env bash

sudo docker run \
  --detach \
  --name kibana \
  --network=host \
  --restart=always \
  -p 5601:5601 \
  --volume=$(pwd)/certs:/usr/share/kibana/certs:ro \
  --env SERVER_HOST="0.0.0.0" \
  --env SERVER_PORT="5601" \
  --env SERVER_MAXPAYLOADBYTES="4194304" \
  --env ELASTICSEARCH_HOSTS="https://elasticsearch-dmz.pensando.dev:9200" \
  --env KIBANA_DEFAULTAPPID="dashboard/653cf1e0-2fd2-11e7-99ed-49759aed30f5" \
  --env LOGGING_DEST="stdout" \
  --env LOGGING_QUIET="false" \
  # --env SERVER_SSL_CERTIFICATE="/usr/share/kibana/certs/kibana-dmz.pensando.dev.cert.pem" \
  # --env SERVER_SSL_KEY="/usr/share/kibana/certs/kibana-dmz.pensando.dev.key.pem" \
  # --env SERVER_SSL_ENABLED="true" \
  # --env ELASTICSEARCH_SSL_CERTIFICATEAUTHORITIES="/usr/share/kibana/certs/ca-chain.cert.pem" \
  # --env ELASTICSEARCH_SSL_VERIFICATIONMODE="none" \
  # --env XPACK_SECURITY_ENABLED="true" \
  # --env ELASTICSEARCH_USERNAME="elastic" \
  # --env ELASTICSEARCH_PASSWORD="pensando" \
  # --env XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY="pensandopensandopensandopensando" \
  docker.elastic.co/kibana/kibana:7.8.0
