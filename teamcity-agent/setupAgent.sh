#!/bin/sh

mkdir -p /opt/agent
wget $TEAMCITY_SERVER/update/buildAgent.zip
unzip -q -d /opt/agent buildAgent.zip
rm buildAgent.zip
chmod +x /opt/agent/bin/agent.sh

# Default command.
sh /opt/agent/bin/agent.sh run