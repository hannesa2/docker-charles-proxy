FROM hannesa2/docker-jetbrains-base:latest

MAINTAINER Hannes Achleitner <hannes.achleitner@googlemail.com>

LABEL info.hannes.ide.name="Charles Proxy" info.hannes.ide.version=4.1.5

#ADD https://www.charlesproxy.com/assets/release/4.1.4/charles-proxy-4.1.4.tar.gz /tmp/ide.tar.gz
ADD https://www.charlesproxy.com/assets/release/4.2.1/charles-proxy-4.2.1.dmg /tmp/charles.dmg

RUN echo Y | hdiutil attach /tmp/charles.dmg \
    && cp -r /Volumes/Charles\ Proxy\ v4.2.1/Charles.app /Applications/ \
    && hdiutil detach /Volumes/Charles\ Proxy\ v4.2.1/    

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/bin/charles"]
