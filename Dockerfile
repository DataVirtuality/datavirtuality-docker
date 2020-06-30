FROM ubuntu:20.04

RUN mkdir -p /opt/datavirtuality
COPY dvserver /opt/datavirtuality/dvserver
COPY dvconfig.conf.props /opt/datavirtuality/dvserver/bin/

RUN mkdir /opt/datavirtuality/persistent_data /opt/datavirtuality/persistent_data/log
RUN mv /opt/datavirtuality/dvserver/standalone/data/datavirtuality/license.lic /opt/datavirtuality/persistent_data/
RUN mv /opt/datavirtuality/dvserver/standalone/configuration/dvserver-standalone.xml /opt/datavirtuality/persistent_data/

RUN ln -s /opt/datavirtuality/persistent_data/license.lic /opt/datavirtuality/dvserver/standalone/data/datavirtuality/license.lic
RUN ln -s /opt/datavirtuality/persistent_data/log /opt/datavirtuality/dvserver/standalone/log
RUN ln -s /opt/datavirtuality/persistent_data/dvserver-standalone.xml /opt/datavirtuality/dvserver/standalone/configuration/dvserver-standalone.xml

VOLUME /opt/datavirtuality/persistent_data

EXPOSE 8080/tcp 31000/tcp 31001/tcp 35432/tcp 35433/tcp

CMD ["/opt/datavirtuality/dvserver/bin/dvserver.sh"]
