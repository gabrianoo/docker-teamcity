FROM ubuntu:14.04
MAINTAINER Ahmed Hassanien <ahmed_hassanien@otasys.com>

#--------------
# Prerequisites
#--------------

## Upgrade ubuntu to latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update
RUN apt-get -yq upgrade

## Install wget
RUN apt-get -yq install --no-install-recommends wget

## Install Software Properties Common to use add-apt-repository command
RUN apt-get -yq install --no-install-recommends software-properties-common

## Add Oracle Java 8 Repository to Ubuntu
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java

## Update
RUN apt-get -q update

#----------------------
# Install Oracle Java 8
#----------------------

RUN apt-get -yq install --no-install-recommends oracle-java8-installer

# Set JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#------------------
# Install Team City
#------------------

# TeamCity data is stored in a volume to facilitate container upgrade
VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

ENV TC_PACKAGE TeamCity-9.1.3.tar.gz
RUN wget http://download.jetbrains.com/teamcity/$TC_PACKAGE
RUN tar zxf $TC_PACKAGE -C /opt
RUN rm -rf $TC_PACKAGE

EXPOSE 8111

#----------------
# Clean Container
#----------------

# Remove unwanted applications & Clean Installations
RUN apt-get autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk8-installer /var/cache/apt

# Default command.
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
