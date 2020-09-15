FROM node:12.18.3-buster

RUN apt-get -y update && apt-get -y install --no-install-recommends git && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/Akkadius/glass-isc-dhcp && cd glass-isc-dhcp &&\
    mkdir logs && chmod u+x ./bin/ -R && chmod u+x *.sh

WORKDIR /opt/glass-isc-dhcp
RUN npm install && npm install forever -g
CMD ["npm", "start"]
