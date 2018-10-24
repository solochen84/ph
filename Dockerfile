# 基础镜像信息
#FROM registry.local/factory/pythonbase:1.0
#FROM registry.local/factory/pythonbase:3.5
#FROM brie/docker-numpy-scipy

FROM ubuntu:16.04

RUN cat >>/etc/apt/sources.list<<EOF \
    deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties \
    deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted \
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted \
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties \
    deb http://mirrors.aliyun.com/ubuntu/ xenial universe \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe \
    deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse \
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties \
    deb http://archive.canonical.com/ubuntu xenial partner \
    deb-src http://archive.canonical.com/ubuntu xenial partner \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted \
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe \
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse \
    EOF

RUN apt-get update


RUN apt-get update && \
    apt-get install -y \
    python3 python3-numpy python3-nose python3-pandas python-h5py \
    python python-numpy python-nose python-pandas python3-h5py \
    pep8 python-pip python3-pip python-wheel \
    python-sphinx && \
    pip install --upgrade setuptools


# 创建目录
RUN mkdir -p /usr/local/ph
# 拷贝文件
ADD ./ /usr/local/ph
# 设置工作目录
WORKDIR /usr/local/ph
# 安装requirements
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "./main.py"]
EXPOSE 5000

