# Adds nodejs to the nginx container
FROM patriknyblad/supervisord-nginx:1.0.0
MAINTAINER Patrik Nyblad <patrik.nyblad@gmail.com>

# Install NodeJS
RUN apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends nodejs &&\
    ln -s "$(which nodejs)" /usr/bin/node &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends npm &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

# Install yarn (nodejs) package manager
RUN npm install -g yarn
