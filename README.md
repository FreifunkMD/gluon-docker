# Freifunk Magdeburg Docker build image

Docker image to build firmware for the [Freifunk Magdeburg](http://md.freifunk.net) community.

## Shell trail

This section shows the commands that are needed to run a build with the Docker image. Make sure you know what you are doing before hitting the Enter key.

### … on the Docker host

Clone the repository:

    git clone https://github.com/FreifunkMD/gluon-docker
    cd gluon-docker/

Use the following commands on the host to create and run the docker image:

    docker build -t ffmd-v2016.2.7 .
    docker run -it --name ffmd ffmd-v2016.2.7

The build process can be configured with build arguments:

    docker build --build-arg FFMD_VERSION=tags/v0.38-beta.1 -t ffmd-v2016.2.7 .

To restart the image once it has been stopped:

    docker start -i ffmd

Once you are done, container and image can be deleted by calling

    docker rm ffmd
    docker rmi ffmd-v2017.2.7

The build needs up to 60 GB of hard disk space. If the docker environment cannot provide the neccessary space, the paths `/gluon/output` and `/gluon/openwrt/build_dir` should be bound to a different directory:

    docker run -it --name ffmd \
        -v "$(pwd)/firmwares:/gluon/output" \
        -v "$(pwd)/openwrt_build:/gluon/openwrt/build_dir" \
        ffmd-v2016.2.7

This will create and bind the directories `firmware` and `openwrt_build` in the current working directory to the container's output directories.


### … in the Docker container

Initialize and run the build with the following commands:

    make update
    site/build.sh
