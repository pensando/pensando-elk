.. _components:

************************
Pensando-ELK Components
************************

The following docker containers are used in the Pensando-ELK implementation

Elasticsearch
------------------
    - Hub Repository: docker.elastic.co/elasticsearch/elasticsearch
    - Container Name: elasticsearch
    - Port(s) Used: 9200
    - Description:



Kibana
------------------
    - Hub Repository: docker.elastic.co/kibana/kibana
    - Container Name: kibana
    - Port(s) Used: 5601
    - Description:



Logstash
------------------
    - Hub Repository: robcowart/elastiflow-logstash-oss:4.0.0-beta
    - Container Name: elastiflow-logstash-oss
    - Port(s) Used: 4739
    - Description:



Filebeat
------------------
    - Hub Repository: docker.elastic.co/beats/filebeat
    - Container Name: pensando-filebeat
    - Port(s) Used: 9001
    - Description:


Suricata
------------------
    - Hub Repository: jasonish/suricata:latest
    - Container Name: suricata
    - Description: