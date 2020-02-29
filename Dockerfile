FROM gcc:9.2.0

#ARG FFMUC_REPO=https://github.com/freifunkMUC/site-ffm.git
ARG FFMUC_REPO=https://github.com/T0biii/site-ffm.git
#ARG FFMUC_VERSION=stable
ARG FFMUC_VERSION=T0biii-test-for-docker


# Update & install packages & cleanup afterwards
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        build-essential \
        gawk \
        git \
        libncurses-dev \
        libssl-dev \
        libz-dev \
        python-pip \
        python3-pip \
        subversion \
        unzip \
        wget && \
    apt-get clean autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN git clone $FFMUC_REPO site-ffm
WORKDIR site-ffm
RUN git checkout -b patched && git checkout $FFMUC_VERSION

RUN pwd

ENV FORCE_UNSAFE_CONFIGURE=1

ENTRYPOINT ["/bin/bash","-c"]
CMD ["cd /site-ffm && make"]
