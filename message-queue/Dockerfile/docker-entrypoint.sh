#!/bin/bash

if [ -z "$RABBITMQ_ADMIN_USERNAME" -a -z "$RABBITMQ_ADMIN_PASSWORD" -a -z "$RABBITMQ_QUEUE_USERNAME" -a -z "$RABBITMQ_QUEUE_PASSWORD" ]; then 
	echo >&2 'You need to specify RABBITMQ_ADMIN_USERNAME, RABBITMQ_ADMIN_PASSWORD, RABBITMQ_QUEUE_USERNAME and RABBITMQ_QUEUE_PASSWORD.'
    exit 1
fi

service rabbitmq-server start && \
rabbitmqctl add_user $RABBITMQ_ADMIN_USERNAME $RABBITMQ_ADMIN_PASSWORD && \
rabbitmqctl set_user_tags $RABBITMQ_ADMIN_USERNAME administrator && \
rabbitmqctl set_permissions $RABBITMQ_ADMIN_USERNAME ".*" ".*" ".*" && \
rabbitmqctl add_user $RABBITMQ_QUEUE_USERNAME $RABBITMQ_QUEUE_PASSWORD
rabbitmqctl set_permissions $RABBITMQ_QUEUE_USERNAME ".*" ".*" ".*" && \
rabbitmq-plugins enable rabbitmq_management
service rabbitmq-server stop

exec "$@"
