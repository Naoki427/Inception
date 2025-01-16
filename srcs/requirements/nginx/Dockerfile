FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl curl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=JP/ST=Tokyo/L=Shinjuku/O=42Tokyo/OU=42Student/CN=nyoshimi.42.fr/UID=nyoshimi"

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY html/index.html  /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]