#!/bin/bash

# Check if the /mapr/clustername mountpoint is available
if [ "$(sudo ls /mapr/ |wc -l)" -eq 0 ]; then
  echo "MapR not running. exiting."
  exit
else
  # launch something
  echo "MapR running. Launching Minio"
  sudo -E /minio server $MINIO_PATH
fi