FROM gcc:9.2.0

# Update & install packages & cleanup afterwards
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
        build-essential \
        ecdsautils \
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

COPY build.sh /

ENV FORCE_UNSAFE_CONFIGURE=1

ENTRYPOINT ["/bin/bash","-c"]
CMD ["./build.sh"]
