FROM alpine:3.7

RUN apk update && apk add mysql-client

WORKDIR /opt

COPY import.sh /opt
COPY mydatabase.sql /opt

EXPOSE 3306

RUN chmod +x /opt/import.sh
CMD /opt/import.sh
