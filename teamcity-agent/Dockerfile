FROM otasys/java:1.8.0_66
MAINTAINER Ahmed Hassanien <ahmed_hassanien@otasys.com>

# Environment Variables
ENV AGENT_DIR=${HOME}/agent

RUN cd ${HOME} \
    mkdir -p $AGENT_DIR \
    wget $TEAMCITY_SERVER/update/buildAgent.zip \
    unzip -q -d $AGENT_DIR buildAgent.zip \
    rm buildAgent.zip \
    chmod +x $AGENT_DIR/bin/agent.sh

# Default command.
CMD ["$AGENT_DIR/bin/agent.sh", "run"]
