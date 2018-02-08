#!flask/bin/python
# -- coding: utf-8 --

__author__ = 'cloudtogo'

from flask import render_template, redirect
from flask import Flask
import os
import redis
import ctypes
import time
import requests

app = Flask(__name__)

# 请您来修正Hello, word的拼写错误吧！
# 请在修改完成后，通过主菜单 Git/Commit ... 菜单项完成代码的Commit 和 Push。
# Push完成后回到Factory ( http://factory.cloudtogo.cn/project/blueprint?id=last )，用同样的方法发布一个新实例即可看到修改后的效果。

msg = 'Hello, world!'

envURL = os.environ.get("WEBIDE")
envRedis = os.environ.get("REDIS")
envRedisPort = os.environ.get("REDIS_PORT")
envExternalUrl = os.environ.get("EXTERNAL_URL")
envFileInput = os.environ.get("FILEINPUT")

@app.route('/')
def hello():
    r = redis.StrictRedis(host=str(envRedis), port=envRedisPort)
    hits = r.get('hits')
    if hits:
        hits = r.get('hits').decode('utf-8')
    else:
    	hits = '0'
    hits = str(int(hits) + 1)
    r.set('hits', hits)
    return render_template('hello.html', Hits=hits, WebIDE=envURL, Msg=msg)

@app.route('/index')
def index():
    #url='http://'+envExternalUrl
    #r = requests.get(url)
    return 'hello'+envFileInput
    

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000)
