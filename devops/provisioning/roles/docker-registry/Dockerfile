#docerfile best practices http://crosbymichael.com/dockerfile-best-practices.html
FROM ubuntu
MAINTAINER George Moon <george.moon@skolr.io>
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# install docker registry
RUN git clone https://github.com/dotcloud/docker-registry.git
WORKDIR docker-registry
ADD config_s3.yml config.yml
RUN pip install -r requirements.txt

