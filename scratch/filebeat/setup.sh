#!/usr/bin/env bash

sudo docker pull docker.elastic.co/beats/filebeat:7.8.0

sudo docker run \
  --name filebeat-setup \
  --network=host \
  --volume=$(pwd)/etc/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro \
  --volume=$(pwd)/module/pensando:/usr/share/filebeat/module/pensando:ro \
  docker.elastic.co/beats/filebeat:7.8.0 \
  setup -E setup.kibana.host=https://kibana-dmz.pensando.dev:5601 \
  -E output.elasticsearch.hosts=["https://elasticsearch-dmz.pensando.dev:9200"] \
  -E setup.kibana.ssl.enabled=true \
  -E setup.kibana.ssl.verification_mode=none \
  -E output.elasticsearch.username="elastic" \
  -E output.elasticsearch.password="pensando" \
  -E output.elasticsearch.ssl.verification_mode="none"
