FROM nvidia/cuda:11.1-cudnn8-devel-ubuntu20.04
LABEL maintainer "zhoujun"

RUN apt-get update \
&& apt install -y libglib2.0-0 libsm6 libxrender1 libxext-dev vim tmux htop \
&& apt-get install -y software-properties-common curl \
&& apt autoremove -y \
&& apt-get install -y python3 python3-dev python3-pip \
&& apt-get install -y build-essential
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python3-tk
WORKDIR /

COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt && rm requirements.txt
ENV LANG C.UTF-8
