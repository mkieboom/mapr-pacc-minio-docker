# Minio on MapR PACC
#
# VERSION 0.1 - not for production, use at own risk
#

#
# Using MapR PACC as the base image
# For specific versions check: https://hub.docker.com/r/maprtech/pacc/tags/
FROM maprtech/pacc

MAINTAINER mkieboom @mapr.com

# Set default folder path in case not provided using: -e MINIO_PATH=/my/path
ENV MINIO_PATH /mapr/demo.mapr.com/minio

# Install Minio
RUN wget https://dl.minio.io/server/minio/release/linux-amd64/minio && \
    chmod +x minio

# Expose the Minio server port
EXPOSE 9000

# Launch Minio server in the provided folder path
CMD sudo /minio server $MINIO_PATH