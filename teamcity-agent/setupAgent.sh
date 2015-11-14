#!/bin/sh

mkdir -p /opt/agent
wget $TEAMCITY_SERVER/update/buildAgent.zip
unzip -q -d /opt/agent buildAgent.zip
rm buildAgent.zip
chmod +x /opt/agent/bin/agent.sh
mv /opt/agent/conf/buildAgent.dist.properties /opt/agent/conf/buildAgent.properties
sed -i "s,http://localhost:8111/,$TEAMCITY_SERVER,g" /opt/agent/conf/buildAgent.properties

# Default command.
sh /opt/agent/bin/agent.sh run