From nginx:latest

WORKDIR /usr/share/nginx

COPY ./dist ./html

Copy default.conf /etc/nginx/conf.d

EXPOSE 80
