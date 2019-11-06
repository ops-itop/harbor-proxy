FROM alpine:3.10

ENV TIMEZONE Asia/Shanghai

RUN	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN	apk add --no-cache tzdata
RUN	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN	echo "${TIMEZONE}" > /etc/timezone
RUN	apk add --no-cache nginx

COPY init.sh /
COPY conf/default.conf /etc/nginx/conf.d/

RUN mkdir /run/nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["sh", "/init.sh"]
