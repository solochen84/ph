# 基础镜像信息
#FROM registry.local/factory/pythonbase:1.0
#FROM registry.local/factory/pythonbase:3.5
#FROM brie/docker-numpy-scipy

FROM ubuntu:16.04

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

