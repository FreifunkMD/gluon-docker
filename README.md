# Freifunk Magdeburg Docker build image

Docker image to build firmware for the [Freifunk Magdeburg](http://md.freifunk.net) community.

The build process is started automatically when the container is run. There is no need to manually run commands inside the container anymore.

## Shell trail

This section shows the commands that are needed to run a build with the Docker image. Make sure you know what you are doing before hitting the Enter key.


Clone the repository:

```bash
git clone https://github.com/FreifunkMD/gluon-docker
cd gluon-docker/
```

Use the following commands on the host to create and run the docker image:

```bash
docker build -t ffmd:latest .
docker run -it --name ffmd ffmd:latest
```

The container will automatically start the firmware build process.

The build process can be configured with build arguments:

```bash
docker build --build-arg FFMD_VERSION=tags/v0.38-beta.1 -t ffmd:latest .
```

To start the container with an arbitrary command, you can:

```bash
docker run -it --name ffmd ffmd:latest "/bin/bash"
´´´

You can run a shell in an existing container with the following command:

```bash
docker exec -it ffmd /bin/bash
```

To restart the image once it has been stopped:

´´´bash
docker start -i ffmd
´´´

Once you are done, container and image can be deleted by calling

```bash
docker rm ffmd
docker rmi ffmd:latest
´´´

The build needs up to 60 GB of hard disk space. If the docker environment cannot provide the neccessary space, the paths `/gluon/output` and `/gluon/openwrt/build_dir` should be bound to a different directory:

´´´bash
docker run -it --name ffmd \
    -v "$(pwd)/firmwares:/gluon/output" \
    -v "$(pwd)/openwrt_build_cache:/gluon/openwrt/build_dir" \
    ffmd:latest
´´´

This will create and bind the directories `firmware` and `openwrt_build_cache` in the current working directory to the container's output directories.
