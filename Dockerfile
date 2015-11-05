FROM otasys/docker-java:1.8.0_66
MAINTAINER Ahmed Hassanien <ahmed_hassanien@otasys.com>

#------------------
# Install Team City
#------------------

# Environment Variables
ENV TEAMCITY_DATA_PATH=/data/teamcity \
    TC_PKG=TeamCity-9.1.3.tar.gz

# TeamCity data is stored in a volume to facilitate container upgrade
VOLUME  ["/data/teamcity"]

RUN wget http://download.jetbrains.com/teamcity/$TC_PKG && \
    tar zxf $TC_PKG -C /opt && \
    rm -rf $TC_PKG

# Expose Teamcity default port
EXPOSE 8111

# Default command.
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
