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

# Add the launch script which checks if the /mapr mountpoint is available in the container
ADD launch.sh /launch.sh
RUN sudo chmod +x /launch.sh

# Expose the Minio server port
EXPOSE 9000

# Launch Minio server in the provided folder path
#CMD sudo -E /minio server $MINIO_PATH
CMD /launch.sh