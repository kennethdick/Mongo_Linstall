FROM       ubuntu:latest

MAINTAINER Kenneth Dick <khdick@gmail.com>

# Import MongoDB pub GPG
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
#Update and install
RUN apt-get update && apt-get install -y mongodb-org
# Make MongoDB data dir
RUN mkdir -p /data/db
# Expose port 28808 from the container to the host
EXPOSE 28808
#Docker entry point
ENTRYPOINT ["/usr/bin/mongod"]
