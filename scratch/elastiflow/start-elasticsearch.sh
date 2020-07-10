#!/usr/bin/env bash

docker run \
  --detach \
  --name elasticsearch \
  --network=host \
  --restart=always \
  --volume=$(pwd)/data:/usr/share/elasticsearch/data \
  --volume=$(pwd)/certs:/usr/share/elasticsearch/config/certs:ro \
  -p 9200:9200 \
  -p 9300:9300 \
  --env ES_JAVA_OPTS="-Xms8g -Xmx8g" \
  --env cluster.name="elastiflow-dmz" \
  --env node.name="elasticsearch-dmz.pensando.dev" \
  --env bootstrap.memory_lock="true" \
  --env network.host="0.0.0.0" \
  --env http.port="9200" \
  --env discovery.type="single-node" \
  --env indices.query.bool.max_clause_count="8192" \
  --env search.max_buckets="10000000" \
  --env action.destructive_requires_name="true" \
  --env http.cors.enabled="true" \
  --env http.cors.allow-origin="*" \
  --env http.cors.allow-credentials="true" \
  --env http.cors.allow-methods="OPTIONS,HEAD,GET,POST,PUT,DELETE" \
  --env http.cors.allow-headers="Requested-With,Content-Type,Content-Length,Authorization,X-Requested-With" docker.elastic.co/elasticsearch/elasticsearch:7.8.0
  # --env xpack.security.transport.ssl.enabled="true" \
  # --env xpack.security.transport.ssl.verification_mode="none" \
  # --env xpack.security.transport.ssl.key="/usr/share/elasticsearch/config/certs/elasticsearch-dmz.pensando.dev.key.pem" \
  # --env xpack.security.transport.ssl.certificate="/usr/share/elasticsearch/config/certs/elasticsearch-dmz.pensando.dev.cert.pem" \
  # --env xpack.security.transport.ssl.certificate_authorities="/usr/share/elasticsearch/config/certs/ca-chain.cert.pem" \
  # --env xpack.security.http.ssl.enabled="true" \
  # --env xpack.security.http.ssl.verification_mode="none" \
  # --env xpack.security.http.ssl.key="/usr/share/elasticsearch/config/certs/elasticsearch-dmz.pensando.dev.key.pem" \
  # --env xpack.security.http.ssl.certificate="/usr/share/elasticsearch/config/certs/elasticsearch-dmz.pensando.dev.cert.pem" \
  # --env xpack.security.http.ssl.certificate_authorities="/usr/share/elasticsearch/config/certs/ca-chain.cert.pem" \
  # --env xpack.security.enabled="true" \
  # --env ELASTIC_PASSWORD="pensando" \
