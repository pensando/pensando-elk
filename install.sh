#!/usr/bin/env bash

################################################################################
#                    DECLARATIVE FUNCTIONS
################################################################################
#
findOS () {
    # Figure out the underlying OS - we support CentOS, Redhat and Ubuntu right now
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd - this should work for 99% of our cases
        . /etc/os-release
        OS=$(echo $NAME |awk {'print $1'})
        VER=$VERSION_ID
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        OS=$(cat /etc/redhat-release | awk {'print $1'})
        VER=$(cat /etc/redhat-release | awk {'print $4'})
    else
        # Can't figure it out so probably not supported - exit
        echo "Unable to determine the OS - exiting......"
        exit 1

    fi
}

initPlaybook () {
    echo "The OS is determined to be $OS"
    if [[ $OS =~ "Ubuntu" ]]
        then
        PLAYBOOK=install_docker_ubuntu.yml
        PYTHON3_APT_DIR=/usr/lib/python3/dist-packages
        sudo apt-get -y install python3-venv
    elif [[ $OS =~ "CentOS" ]]
        then
        PLAYBOOK=install_docker_centos.yml
    elif [[ $OS =~ "RedHat" ]]
        then
        PLAYBOOK=install_docker_centos.yml
    else
        echo "The OS type of $OS is unsupported, exiting"
        exit 1
    fi
}

adjustUser () {
    # Function to change add user to sudo so we don't have to use a password all the time and modify groups
    echo "$userName ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$userName-nopasswd
    sudo groupadd docker
    sudo usermod -a -G $userName docker
}
################################################################################
#                          SYSTEM SETUP
################################################################################
#
findOS
initPlaybook

# Figure out who we are so we write the correct paths
userName=$(echo $USER)
userHome=$(eval echo "~$userName" )
adjustUser
printf "\n[INSTALL]: $(tput setaf 6)Setting up for user $userName in $userHome directory $(tput sgr 0)\n"

# Create backup directory and make world writeable so elasticsearch can use it.
if [ ! -d "$userHome/es_backup" ]; then
  printf "\n[INSTALL]: $(tput setaf 2)Creating directory for ES backups$(tput sgr 0)\n"
  install -d -m 0777 -o $userName -g $(id -gn $userName) $userHome/es_backup
else
  printf "\n[INSTALL]: $(tput setaf 1)Backup directory already exists, skipping$(tput sgr 0)\n"
fi

if [ ! -d "./.venv" ]; then
  printf "\n[INSTALL]: $(tput setaf 6)Creating virtualenv$(tput sgr 0)\n"
  python3.6 -m venv --system-site-packages .venv
fi

printf "\n[INSTALL]: $(tput setaf 6)Activating virtualenv and installing dependencies$(tput sgr 0)\n\n"
source .venv/bin/activate
pip install --upgrade pip
pip install -r install/requirements.txt

printf "\n[INSTALL]: $(tput setaf 6) Running $PLAYBOOK installer.......$(tput sgr 0)\n\n"

ansible-playbook install/$PLAYBOOK