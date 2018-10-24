# 基础镜像信息
#FROM registry.local/factory/pythonbase:1.0
#FROM registry.local/factory/pythonbase:3.5
#FROM brie/docker-numpy-scipy

FROM ubuntu:16.04

RUN echo "deb-src http://archive.ubuntu.com/ubuntu xenial main restricted" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://archive.canonical.com/ubuntu xenial partner" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.canonical.com/ubuntu xenial partner" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse" >> /etc/apt/sources.list

RUN apt-key update && apt-get update && apt-get install -y wget
RUN apt-get remove python-pip python3-pip 
RUN apt-get install -y python3
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate 
RUN python3 get-pip.py 

RUN apt-get install -y \
    python3-numpy python3-nose python3-pandas python-h5py \
    python python-numpy python-nose python-pandas python3-h5py \
    pep8 python-wheel  python-sphinx 

# 创建目录
RUN mkdir -p /usr/local/ph

# 拷贝文件
ADD ./ /usr/local/ph

# 设置工作目录
WORKDIR /usr/local/ph

# 安装requirements
RUN /usr/local/bin/pip3 install --no-cache-dir -r requirements.txt
CMD ["python3", "./main.py"]
EXPOSE 5000

