FROM node:12.18.3-buster
RUN apt-get update && apt-get install git

WORKDIR /opt

VOLUME ["/opt/glass-isc-dhcp/config/glass_config.json", "/opt/glass-isc-dhcp/logs"]

RUN git clone https://github.com/Akkadius/glass-isc-dhcp && cd glass-isc-dhcp &&\
    mkdir logs && chmod u+x ./bin/ -R && chmod u+x *.sh

WORKDIR /opt/glass-isc-dhcp
RUN npm install && npm install forever -g
CMD ["npm", "start"]