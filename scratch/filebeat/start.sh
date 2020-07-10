#!/usr/bin/env bash

sudo docker pull docker.elastic.co/beats/filebeat:7.8.0

sudo docker run \
  --detach \
  --name filebeat \
  --network=host \
  --restart always \
  -p 0.0.0.0:4739:4739/udp \
  -p 0.0.0.0:9001:9001/udp \
  --volume=$(pwd)/etc/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro \
  --volume=$(pwd)/etc/ipfix.yml:/usr/share/filebeat/ipfix.yml:ro \
  --volume=$(pwd)/module/pensando:/usr/share/filebeat/module/pensando:ro \
  --volume=$(pwd)/certs:/etc/certs:ro \
  --volume=suricata_logs:/var/log/suricata:ro \
  --volume=zeek_logs:/var/log/zeek:ro \
  docker.elastic.co/beats/filebeat:7.8.0 filebeat -e -strict.perms=false \
  -E output.elasticsearch.hosts=["https://elasticsearch-dmz.pensando.dev:9200"] \
  -E output.elasticsearch.username="elastic" \
  -E output.elasticsearch.password="pensando" \
  -E output.elasticsearch.ssl.certificate_authorities=["/etc/certs/ca-chain.cert.pem"] \
  -E output.elasticsearch.ssl.certificate="/etc/certs/filebeat-dmz.pensando.dev.cert.pem" \
  -E output.elasticsearch.ssl.key="/etc/certs/filebeat-dmz.pensando.dev.key.pem" \
  -E output.elasticsearch.ssl.verification_mode="none" \
  --modules netflow,zeek,suricata
