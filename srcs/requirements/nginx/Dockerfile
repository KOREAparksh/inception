FROM alpine:3.16

WORKDIR /usr/src/app

RUN apk add nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
RUN mkdir ./build

ADD ./build ./build

COPY ./conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
