FROM node:12-buster
WORKDIR /app

RUN apt update && apt install -y libaio1 libaio-dev
ADD https://download.oracle.com/otn_software/linux/instantclient/191000/instantclient-basiclite-linux.arm64-19.10.0.0.0dbru.zip /opt/oracle/instantclient.zip
RUN unzip /opt/oracle/instantclient.zip -d /opt/oracle
RUN echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig

COPY package*.json ./
RUN npm install

CMD ["npm","run","start"]