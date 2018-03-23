FROM gcc:7.2

RUN apt-get update 
RUN apt-get install -y git subversion python-pip python3-pip build-essential gawk unzip libncurses-dev  libz-dev  libssl-dev wget

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
