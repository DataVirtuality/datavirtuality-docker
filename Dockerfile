FROM ubuntu:20.04

RUN mkdir -p /opt/datavirtuality
COPY dvserver /opt/datavirtuality/dvserver

WORKDIR /opt/datavirtuality/dvserver

COPY dvconfig.conf.props bin/
COPY dvserver-container.sh bin/

RUN mkdir /opt/datavirtuality/original_files && cp standalone/data/datavirtuality/license.lic /opt/datavirtuality/original_files/ && cp standalone/configuration/dvserver-standalone.xml /opt/datavirtuality/original_files/

RUN mkdir /opt/datavirtuality/persistent_data /opt/datavirtuality/persistent_data/log
RUN mv standalone/data/datavirtuality/license.lic /opt/datavirtuality/persistent_data/
RUN mv standalone/configuration/dvserver-standalone.xml /opt/datavirtuality/persistent_data/

RUN ln -s /opt/datavirtuality/persistent_data/license.lic standalone/data/datavirtuality/license.lic
RUN ln -s /opt/datavirtuality/persistent_data/log standalone/log
RUN ln -s /opt/datavirtuality/persistent_data/dvserver-standalone.xml standalone/configuration/dvserver-standalone.xml

VOLUME /opt/datavirtuality/persistent_data

EXPOSE 8080/tcp 31000/tcp 31001/tcp 35432/tcp 35433/tcp

CMD ["bin/dvserver-container.sh"]
