FROM ubuntu:latest

ADD dvserver-TRUNK.linux.x86_64.zip /tmp/dvserver.zip
RUN apt-get update && apt-get -y install unzip
RUN mkdir -p /opt/datavirtuality && unzip /tmp/dvserver.zip -d /opt/datavirtuality/ && rm /tmp/dvserver.zip
ADD dvconfig.conf.props /opt/datavirtuality/dvserver/bin/

EXPOSE 8080/tcp
EXPOSE 31000/tcp
EXPOSE 31001/tcp
EXPOSE 35432/tcp
EXPOSE 35433/tcp

CMD ["/opt/datavirtuality/dvserver/bin/dvserver.sh"]
