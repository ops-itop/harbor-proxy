#!/bin/bash

if [ "$HARBOR_DOMAIN"x != ""x ];then
	sed -i "s/cr-harbor-core.intra.svc.cluster.local/$HARBOR_DOMAIN/g" /etc/nginx/conf.d/default.conf
fi

if [ -f $APP_CONFIG_PATH/ALLOW ];then
	cp $APP_CONFIG_PATH/ALLOW /etc/nginx/allow.conf
else
	touch /etc/nginx/allow.conf
fi

if [ "$AUTH"x != ""x ];then
	sed -i "s/\$http_authorization/\"$AUTH\"/g" /etc/nginx/conf.d/default.conf
fi

exec nginx -g 'daemon off;'
