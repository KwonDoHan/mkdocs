<!-- - [Set up docker private registry](#set-up-docker-private-registry)
  - [Overview](#overview)
  - [TL;DR](#tldr)
  - [Set up server](#set-up-server)
    - [Pull and test basic image](#pull-and-test-basic-image)
    - [Change stored directory](#change-stored-directory)
    - [Backup and restore registry volume](#backup-and-restore-registry-volume)
- [Options](#options) -->

## Set up docker private registry

By default docker pulls images from [docker.hub](https://hub.docker.com/), it requires Internet to download images. In many cases, the server is located in a private network which is not allow to access Internet such as security policy. This guide provides a set up steps and a briefly description to run a registry server in local network. For more detail, please visit the [official setup guide](https://docs.docker.com/registry/deploying/)

This guide includes 2 steps:

- Pull and configure a local registry server which comes from [github repo](https://github.com/docker/distribution-library-image)
- Configure docker client to fetch images from local server.

### Overview

We're gonna set up a registry server runs on http://localhost:5000 and stored images at `/var/lib/registry`. Once server is up, we pull a python image from docker.hub, then push to our local private server.

### TL;DR

Make sure the container images exists docker daemon.
```
$ docker images registry:2
REPOSITORY    TAG        IMAGE ID        CREATED         SIZE
registry      2          d1fd7d86a825    5 months ago    33.3MB
```

Run the following command to start the server.

```sh
docker run -d -p 5000:5000 --name registry -v <physical_path>:/var/lib/registry registry:2
```

Verify port and services:

```json
curl http://<registry_ip>:5000/v2/_catalog
{
    "repositories": []
}
```

Configure docker daemon in `/etc/docker/daemon.json` pull from private registry

```json
{
  "insecure-registries": ["register_ip:5000"]
}
```

### Set up server

!!! tip
Docker removes container automatically with flag `--rm`.

#### Pull and test basic image

Pull registry server to local

```sh
$ docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

- `-d` daemon mode
- `-p 5000:5000` mapping port physical -> container
- `--restart=always` run this container after docker started
- `--name registry` container name

Now, the service is running a service at port 5000

```
$ docker ps
```

Verify:

```
$ docker images -a
REPOSITORY    TAG     IMAGE ID       CREATED         SIZE
registry      2       d1fd7d86a825   4 months ago    33.3MB
```

In order to copy an image to local repo, we perform the following steps:

1.  pull image from docker.hub
2.  Assign tag for images
3.  push to local registry

```
$ docker pull python:alpine3.6 # pull image from docker.hub
$ docker tag python:alpine3.6 localhost:5000/python:alpine3.6 # assign tag for image
$ docker push localhost:5000/python:alpine3.6 # push to local repo
```

Verify uploaded image in registry

```json
http GET localhost:5000/v2/_catalog
{
    "repositories": [
        "python"
    ]
}
```

#### Change stored directory

Once the server is up and run. we inspect the server default location.

```sh
$ docker inspect registry
```

```json
...
"Mounts":[
      {
         "Type":"volume",
         "Name":"e71f65b9da143a99e8f391b3f5ab8903184cae58a2d3416de23a8d375775e822",
         "Source":"/var/lib/docker/volumes/e71f65b9da143a99e8f391b3f5ab8903184cae58a2d3416de23a8d375775e822/_data",
         "Destination":"/var/lib/registry",
         "Driver":"local",
         "Mode":"",
         "RW":true,
         "Propagation":""
      }
   ]

...
```

Now, we can change the location by docker volume feature.

```sh
docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  -v /mnt/registry:/var/lib/registry \
  registry:2
```

- `-v` map physical path `/mnt/registry` &rarr; container path `/var/lib/registry`

#### Backup and restore registry volume

Simple solution:

- Back up by compressing physical directory.

```
$ tar cvf registry.tar.gz /mnt/registry
```

- Restore by extracting the compressed file, then run again with mapping volume.

## Options

Remove local cache

```sh
$ docker image remove python:alpine3.6
$ docker image remove localhost:5000/python:alpine3.6
```

Stop container

```sh
docker container stop <container_name>
```

!!! info
Change service inside container port by specify environment variable `REGISTRY_HTTP_ADDR` with `-e` flag

```sh
docker run -d \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5001 \
  -p 5001:5001 \
  --name registry-test \
  registry:2
```

Configure container with volume.

```
$ docker volume create registry
$ docker-private-registry docker volume inspect registry
```

```json
[
  {
    "CreatedAt": "2018-05-28T00:45:06+09:00",
    "Driver": "local",
    "Labels": {},
    "Mountpoint": "/var/lib/docker/volumes/registry/_data",
    "Name": "registry",
    "Options": {},
    "Scope": "local"
  }
]
```
