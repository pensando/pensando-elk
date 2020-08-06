.. _advanced-settings:

**********************
Advanced Settings
**********************

Before installation, you may want to tweak one or more of the following settings.

ES_JAVA_OPTS
------------------
    This option configures the amount of memory that Java will set aside for elasticsearch
    to run and use.  The setting is in the **pensando-elk/vars/vars.yml** file.

    | By default this is set to use 8GB of RAM.  It is recommended that you use half of the
    | available RAM for this, up to 32GB for the setting on a system with 64GB of RAM.

    Common options are:
        - 16GB = "-Xms8g -Xmx8g"
        - 24GB = "-Xms12g -Xmx12g"
        - 32GB = "-Xms16g -Xmx16g"
        - 64GB = "-Xms32g -Xmx32g"

|


EF_LS_JAVA_OPTS
------------------
    This option configures the amount of memory that Java will set aside for elasticsearch
    to run and use.  The setting is in the **pensando-elk/vars/vars.yml** file.

    | By default this is set to use 4GB of RAM.  This is, most likely, the proper setting,
    | but configuration is available if you have the RAM and want to see if changing it improves any performance.

|


ELK_TAG
------------------
    This **environmental variable** sets the version of Elasticsearch, Kibana and Filebeat to use.  If it is not
    set via the running users environment, it defaults to v7.8.0
