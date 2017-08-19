# mapr-pacc-minio-docker

##### Clone the project
```
git clone https://github.com/mkieboom/mapr-pacc-minio-docker  
cd mapr-pacc-minio-docker  
```

#### Build the Minio PACC container
```
docker build -t mkieboom/mapr-pacc-minio-docker .
```

#### Specify storage location
The storage path defaults to /mapr/demo.mapr.com/minio but can be overriden by providing setting the MINIO_PATH variable in the below docker run commands, eg:  
```
-e MINIO_PATH=/mapr/demo.mapr.com/my_minio_path
```

#### Run the Minio PACC container
```
docker run -it \
--cap-add SYS_ADMIN \
--cap-add SYS_RESOURCE \
--device /dev/fuse \
-e MAPR_CLUSTER=demo.mapr.com \
-e MAPR_CLDB_HOSTS=MAPRN01 \
-e MAPR_CONTAINER_USER=mapr \
-e MAPR_CONTAINER_GROUP=mapr \
-e MAPR_CONTAINER_UID=5000 \
-e MAPR_CONTAINER_GID=5000 \
-e MAPR_MOUNT_PATH=/mapr \
-p 9000:9000 \
mkieboom/mapr-pacc-minio-docker
```

#### Run the Minio PACC container as a deamon
```
docker run -d \
--name minio \
--cap-add SYS_ADMIN \
--cap-add SYS_RESOURCE \
--device /dev/fuse \
-e MAPR_CLUSTER=demo.mapr.com \
-e MAPR_CLDB_HOSTS=MAPRN01 \
-e MAPR_CONTAINER_USER=mapr \
-e MAPR_CONTAINER_GROUP=mapr \
-e MAPR_CONTAINER_UID=5000 \
-e MAPR_CONTAINER_GID=5000 \
-e MAPR_MOUNT_PATH=/mapr \
-p 9000:9000 \
mkieboom/mapr-pacc-minio-docker
```
When running as a deamon, use the following command to get the accesskey and secretkey
```
docker logs minio | grep 'mc config host'
```

#### Connect to the Minio UI
```
Open your browser and point to http://localhost:9200
```





