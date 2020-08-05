Overview
======================

Current Verison:  0.0.1a

The pensando-elk implementation is a combination of several open source, Elastic based applications
plus the Pensando Systems implementation of Elastic logstash/filebeat applications.  By downloading and
installing the pensando-elk software, there is a curated view of the following, disparate implementations:

    + **Pensando Distributed Firewall**: logging from Pensando DSC firewalls

    + `Elastiflow <https://github.com/robcowart/elastiflow/tree/4.x-dev>`_: Network flow data gathered from Pensando DSCs

    + `Suricata <https://suricata-ids.org/>`_: Network threat detection engine using ERSPAN II logs

    + `Zeek <https://zeek.org/>`_: Configurable packet stream reader that converts ERSPAN III logs to events and alerts


To use pensando-elk, you only need a CentOS 8 or Ubuntu 18.04 server/VM with the following minimums:

    + 4 CPU
    + 16GB RAM - (up to 64GB supported)
    + 128GB HDD

From there, you can :ref:`install`Install, :ref:`run`Run and then perform an initial :ref:`setup`Setup
