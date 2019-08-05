# 基础镜像信息
FROM ubuntu:16.04

# 创建目录
RUN mkdir -p /usr/local/ph

# 拷贝文件
ADD ./ /usr/local/ph

# 设置工作目录
WORKDIR /usr/local/ph

# 安装requirements
RUN /usr/local/bin/pip install --no-cache-dir -r requirements.txt
CMD ["python", "./main.py"]
EXPOSE 5000
