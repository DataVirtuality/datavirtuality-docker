FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ADD dvserver-TRUNK.linux.x86_64.zip /tmp/dvserver.zip
RUN apt-get update && apt-get -y install unzip runit-systemd && \
    apt install -y mc atop htop net-tools iputils-ping apt-utils
RUN mkdir -p /opt/datavirtuality && unzip /tmp/dvserver.zip -d /opt/datavirtuality/ && rm /tmp/dvserver.zip
ADD dvconfig.conf.props /opt/datavirtuality/dvserver/bin/

ADD dvserver_move_to_ext_volume.sh /opt/datavirtuality/

EXPOSE 8080/tcp 31000/tcp 31001/tcp 35432/tcp 35433/tcp

CMD ["/bin/bash"]
####CMD ["/opt/datavirtuality/dvserver/bin/dvserver.sh"]
