.. _stop-pensando-elk:

Stop
======================

To stop the cluster from running, issue the following command

.. code-block:: bash

    ansible-playbook stop_elk.yml


This will stop the following containers:

- pensando-filebeat
- elastiflow-logstash-oss
- elasticsearch
- kibana

You may, inadvertently, have started another container, such as pensando-filebeat-setup, that is not needed.
To see if all of the containers are stopped, you can issue the following command:

.. code-block:: bash

    docker ps

You should not have any containers running. [1]_



.. [1] If this system has other containers, you may have output but hopefully not any of the above.