# This Dockerfile will create the Message Queue for OpenStack Queens
FROM ubuntu:16.04
MAINTAINER Lu Yi-Si <luyisi@1000cc.net>

# Use the repository by 163.com
COPY sources.list /etc/apt/

# Install rabbitmq-server
RUN apt-get update && \
    apt-get install rabbitmq-server -y

# Push the startup script
COPY docker-entrypoint.sh /usr/local/bin/

# Setup the startup script
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify the communication port
EXPOSE 5672 15672 25672

# Specify the daemon inside the container
CMD ["rabbitmq-server"]
