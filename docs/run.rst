.. _running-pensando-elk:

Run
======================

While the install and setup procedures are done only once, these run instructions can be
run numerous times since you may start and :ref:`stop-pensando-elk` ad-hoc.

To start Pensando ELK, you must be in the virtualenv that was created during the install.
You can then run the playbook.

.. code-block:: bash

    cd <install-dir>
    source .venv/bin/activate
    ansible-playbook start_elk.yml


If this is the first time you are starting Pensando ELK, refer to the ref:`setup-pensando-elk` section
for a one time setup procedure to install the correct dashboards.