# ubuntu 20.04 is a distro this role SHOULD work on, therefore test against it
FROM docker.io/ubuntu:20.04

# Explicitly state installs have to be noninteractive
# I dont want apt installs to get hung up on asking for a timezone or something
# https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update

# set up python for ansible access
# set up flatpak runtime so we can install applications from it
RUN apt install -y python3 python3-pip flatpak
