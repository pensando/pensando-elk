.. _install-pensando-elk:

**********************
Install
**********************
.. toctree::
   :hidden:

   advanced-settings

The install workflow assumes that the system does not have the pre-requisite packages, like
docker and virtualenv, and will install those.  If you already have docker, python3.6 or python3-venv
this installer *may* change one, or more, of those packages.


All that is really needed is a base OS of CentOS 8.x or Ubuntu 18.04 and the installer will
do the following:

1. Determine the OS
2. Create the appropriate directories and install packages for python virutalenv
3. Give the installing user the ability to run sudo without a password [1]_
4. Create a virtualenv and install the appropriate libraries (i.e. ansible, click, etc.)
5. Run ansible playbook(s) to install docker and configure for non-root usage

.. seealso:: If you wish to change any of the settings before installing, visit the :ref:`advanced-settings`

To execute, cd into the base directory of pensando-elk and run the install script:

.. code-block:: bash

    ./install.sh

Once that is done, you can then move onto the :ref:`running-pensando-elk` section

.. [1] The installer script may ask for your sudo password at install time, but only once