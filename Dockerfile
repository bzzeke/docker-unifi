ARG arch=amd64
FROM ${arch}/alpine:latest

WORKDIR /srv
VOLUME /app

USER root

RUN apk add --no-cache openjdk8-jre mongodb supervisor rsyslog
RUN wget http://www.ubnt.com/downloads/unifi/5.8.24/UniFi.unix.zip
RUN unzip UniFi.unix.zip
RUN mv UniFi unifi
RUN chmod o-rwx unifi
RUN rm /srv/unifi/bin/mongod
RUN ln -s /usr/bin/mongod /srv/unifi/bin/mongod
ADD config/ /

CMD ["/app/run.sh"]