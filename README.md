## Prepare the build
Prior to building the container, copy your SSH public key over `ashahba.pub` and rename it properly.

## build the container
```
docker build --build-arg UNAME="${USER}" -f Dockerfile -t ssh-docker .
```

## run the container
```
docker run --rm --name=ssh-docker -d -it ssh-docker:latest bash
```

## find the container's IP
```
$ docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-docker
172.17.0.2
```

## ssh into the running container from the host
```
ssh ${USER}@172.17.0.2
```
