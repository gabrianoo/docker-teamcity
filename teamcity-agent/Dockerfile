FROM otasys/java:1.8.0_66
MAINTAINER Ahmed Hassanien <ahmed_hassanien@otasys.com>

ADD setupAgent.sh /opt/setupAgent.sh

RUN DEBIAN_FRONTEND=noninteractive && \
	chmod +x /opt/setupAgent.sh && \
	apt-get -q update && \
	apt-get -yq install unzip git && \
	apt-get autoremove && \
	rm /bin/sh && ln -s /bin/bash /bin/sh && \
    	apt-get clean && \
    	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/unzip

# Default command.
CMD ["bash", "/opt/setupAgent.sh"]
