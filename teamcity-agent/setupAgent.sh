#!/bin/sh

mkdir -p /opt/agent
wget --no-check-certificate $TEAMCITY_SERVER/update/buildAgent.zip
unzip -q -d /opt/agent buildAgent.zip
rm buildAgent.zip
chmod +x /opt/agent/bin/agent.sh
mv /opt/agent/conf/buildAgent.dist.properties /opt/agent/conf/buildAgent.properties
sed -i "s,http://localhost:8111/,$TEAMCITY_SERVER,g" /opt/agent/conf/buildAgent.properties
# For Unidirection conection (Agent-To-Server)
sed -i "s,ownPort=9090,#ownPort=9090,g" /opt/agent/conf/buildAgent.properties

if [ ! -z "$AGENT_NAME" ]; then
    sed -i "s,name=,name=$AGENT_NAME,g" /opt/agent/conf/buildAgent.properties
fi 

# Default command.
sh /opt/agent/bin/agent.sh run
