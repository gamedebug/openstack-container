# This Dockerfile will create the Memory cache service for OpenStack Queens
FROM ubuntu:16.04
MAINTAINER Lu Yi-Si <luyisi@1000cc.net>

# Use the repository by 163.com
COPY sources.list /etc/apt/

# Install memcached
RUN apt-get update && \
    apt-get install memcached -y

# Push the startup script
COPY docker-entrypoint.sh /usr/local/bin/

# Setup the startup script
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify the user
USER memcache

# Specify the communication port
EXPOSE 11211

# Specify the daemon inside the container
CMD ["memcached"]
