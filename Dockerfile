# docerfile best practices http://crosbymichael.com/dockerfile-best-practices.html
FROM ubuntu
MAINTAINER George Moon <george.moon@skolr.io>
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# install docker registry
RUN git clone https://github.com/dotcloud/docker-registry.git
ADD config_s3.yml docker-registry/config.yml
RUN cd docker-registry && pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "--access-logfile", "-", "--log-level debug", "--debug",  "-b 0.0.0.0:5000", "-w 1", "wsgi:application"]

