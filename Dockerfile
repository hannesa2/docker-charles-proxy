FROM phusion/baseimage:0.10.0

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Charles Proxy" org.kurron.ide.version=4.1.5

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

EXPOSE 80

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jdk

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ADD https://www.charlesproxy.com/assets/release/4.2.1/charles-proxy-4.2.1_amd64.tar.gz /tmp/charles.tar.gz

RUN mkdir -p /opt/charles && \
    tar zxvf /tmp/charles.tar.gz --strip-components=1 -C /opt/charles && \
    rm /tmp/charles.tar.gz

ENTRYPOINT ["/opt/charles/bin/charles"]
