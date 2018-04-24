FROM gcc:7.2

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

RUN git clone git://github.com/freifunk-gluon/gluon.git 
WORKDIR gluon
RUN git checkout origin/v2016.2.x

# COPY profiles.mk /gluon/targets/ar71xx-generic/profiles.mk
COPY buildOnly.sh buildOnly.sh


RUN git clone https://github.com/johannwagner/site-ffmd.git site
WORKDIR site
RUN git checkout tags/v0.38-beta.1

WORKDIR /gluon
RUN pwd

# RUN make update

ENV FORCE_UNSAFE_CONFIGURE=1

ENTRYPOINT ["/bin/bash"]
# CMD ["./site/build.sh", "-v"] 
