FROM debian:9

RUN apt-get update;

#Install apache
RUN apt-get install -y apache2;

#Install php
RUN apt-get install -y php php-curl php-mbstring php-zip php-gd php-mysql;

RUN apt-get install -y mysql-client

RUN rm /etc/apache2/sites-available/*;\
rm /etc/apache2/sites-enabled/*;
ADD ./conf /etc/apache2/sites-available
ADD ./apache2.conf /etc/apache2/apache2.conf


ADD ./startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh

EXPOSE 80

CMD ./tmp/startup.sh; bash;

# docker build -t default-server .
# docker run -it --rm -v /Users/justinrau/www/default-server/www:/www -p 8080:80 default-server

# docker run -dit -v /Users/justinrau/www/default-server/www:/www -p 8080:80 default-server
# docker exec -it de920f56f4d6 bash