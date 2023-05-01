#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# pipenv-feature/install.sh
# Licensed under the MIT License.
#-------------------------------------------------------------------------------------------------------------
#
# Docs: 
# Maintainer: infrashift.sh
#
# Notes: This is the feature activation entrypoint script; It is ALWAYS executed as the 'root' user.
set -e

echo "                                                                                "
echo "********************************************************************************"
echo "Activating feature 'pipenv-feature'                                             "
echo "                                                                                "
echo " Installs pipenv for the \$SECUREDEVCONTAINER_USERNAME user; normally 'vscode'  "
echo "********************************************************************************"
echo "                                                                                "

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective DevContainer remoteUser is '${_REMOTE_USER}'"
echo "The effective DevContainer remoteUser's home directory is '${_REMOTE_USER_HOME}'"

echo "The effective DevContainer containerUser is '${_CONTAINER_USER}'"
echo "The effective DevContainer containerUser's home directory is '${_CONTAINER_USER_HOME}'"

echo "The effective DevContainer Feature user is '${SECUREDEVCONTAINER_FEATURE_USERNAME}'"
echo "The effective DevContainer Feature user UID is '${SECUREDEVCONTAINER_FEATURE_USER_UID}'"
echo "The effective DevContainer Feature user GID is '${SECUREDEVCONTAINER_FEATURE_USER_GID}'"
echo "The effective DevContainer Feature user home is '${SECUREDEVCONTAINER_FEATURE_USER_HOME}'"

# List feature installation assets
ls -al .

# Change ownership of feature installation assets
chown -R ${SECUREDEVCONTAINER_FEATURE_USERNAME}:${SECUREDEVCONTAINER_FEATURE_USERNAME} .
echo ""

# Execute ansible-inventory as the Secure DevContainer Feature user
# This will showcase issues with the inventory before making use of the inventory to run the activate-feature playbook
echo "Parsing Ansible Inventory for host 'localhost'..."
su -s /bin/bash ${SECUREDEVCONTAINER_FEATURE_USERNAME} <<EOF
    ${SECUREDEVCONTAINER_FEATURE_USER_LOCAL_BIN_PATH}/ansible-inventory --inventory ${SECUREDEVCONTAINER_FEATURE_USER_HOME}/hosts.yml --host localhost --yaml
EOF
echo ""

# Execute ansible-playbook as 'ansible' user
su -s /bin/bash ${SECUREDEVCONTAINER_FEATURE_USERNAME} <<EOF
    ${SECUREDEVCONTAINER_FEATURE_USER_LOCAL_BIN_PATH}/ansible-playbook --inventory ${SECUREDEVCONTAINER_FEATURE_USER_HOME}/hosts.yml activate-feature.yml -e "target_username=${SECUREDEVCONTAINER_USERNAME}"
EOF

echo "                                                                                "
echo "********************************************************************************"
echo "END FEATURE ACTIVATION                                                          "
echo "********************************************************************************"
echo "                                                                                "

