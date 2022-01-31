# use ubuntu20.04 with python set up
FROM docker.io/ubuntu:20.04
RUN apt update
RUN apt install -y python3 python3-pip flatpak
