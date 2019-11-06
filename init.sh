#!/bin/bash

if [ "$HARBOR_DOMAIN"x != ""x ];then
	sed -i "s/cr-harbor-core.intra.svc.cluster.local/$HARBOR_DOMAIN/g" /etc/nginx/conf.d/default.conf
fi

if [ -f $APP_CONFIG_PATH/DENY ];then
	cp $APP_CONFIG_PATH/DENY /etc/nginx/deny.conf
else
	touch /etc/nginx/deny.conf
fi

exec nginx -g 'daemon off;'
