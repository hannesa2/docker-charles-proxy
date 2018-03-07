FROM phusion/baseimage:0.10.0

MAINTAINER Hannes Achleitner <hannes.achleitner@googlemail.com>

LABEL info.hannes.ide.name="Charles Proxy" info.hannes.ide.version=4.1.5

ADD https://www.charlesproxy.com/assets/release/4.1.4/charles-proxy-4.1.4.tar.gz /tmp/ide.tar.gz

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN mkdir -p /opt/ide && \
    tar zxvf /tmp/ide.tar.gz --strip-components=1 -C /opt/ide && \
    rm /tmp/ide.tar.gz && \
    ls /opt/ide -la

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#USER developer:developer
#WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/bin/charles"]
