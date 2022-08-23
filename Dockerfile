FROM ubuntu:18.04
LABEL maintainer="Kodelint <kodelint@gmail.com>"

ARG CHANNEL=stable
ARG VERSION=20.10.168
ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/opt/chef-workstation/bin:/opt/chef-workstation/embedded/bin:/root/.chefdk/gem/ruby/2.7.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Run the entire container with the default locale to be en_US.UTF-8
RUN apt-get update && \
    apt-get install --no-install-recommends -y locales=2.27-3ubuntu1.6 \
    apt-transport-https=1.6.14 \
    lsb-release=9.20170808ubuntu1 \
    gnupg=2.2.4-1ubuntu1.6 \
    libcurl4=7.58.0-2ubuntu3.19 \
    curl=7.58.0-2ubuntu3.19 && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    CHEF_LICENSE="accept-silent"

RUN apt-get update && \
    apt-get install --no-install-recommends -y gcc=4:7.4.0-1ubuntu2.3 \
    git=1:2.17.1-1ubuntu0.12 \
    graphviz=2.40.1-2 \
    make=4.1-9.1ubuntu1 \
    rsync=3.1.2-2.1ubuntu1.5 \
    ssh=1:7.6p1-4ubuntu0.7 \
    vim-tiny=2:8.0.1453-1ubuntu1.8 \
    software-properties-common=0.96.24.32.18 \
    python3-pip=9.0.1-2.3~ubuntu1.18.04.5 && \
    ln -s /usr/bin/vi /usr/bin/vim && \
    curl --silent -o /tmp/chef-workstation.deb "http://packages.chef.io/files/${CHANNEL}/chef-workstation/${VERSION}/ubuntu/18.04/chef-workstation_${VERSION}-1_amd64.deb" && \
    dpkg -i /tmp/chef-workstation.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*log /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old

RUN apt-get update && \
    apt-get install -y awscli=1.18.69-1ubuntu0.18.04.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*log /var/log/apt/* /var/lib/dpkg/*-old /var/cache/debconf/*-old && \
    pip3 install --no-cache-dir boto3==1.23.10

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

CMD ["/bin/bash"]
