# vue-cli-docker
docker 快速搭建vue的开发环境
vue脚手架容器，用于保持干净环境而设定的 使用方式很简单，配合docker-compose命令来创建、运行、开发、打包你的项目。


docker-compose.yml的内容
```
version: '3'

services:
    web:
      build: .
      command: npm run dev
      volumes:
          - .:/app
      ports:
          - "8080:8080"
```




Dockerfile的内容
```
FROM neekin/vue-cli:2.9.6
RUN mkdir /app
WORKDIR  /app
COPY . /app
```





请新建一个目录做为你的项目目录，并将Dockerfile和docker-compose.yml放在这个目录里。(windows用户请先做好磁盘权限的共享，否则创建项目的时候会失败)

1.使用命令生成你项目的镜像 
```shell
docker-compose build
```
2.等待完成后，即可以使用docker-compose的命令创建项目了
```shell
docker-compose run web vue init webpack .
```
3.等待项目生成完成后，修改package.json文件,找到 scripts字段下面的dev字段,修改下面这样
```
"dev":"webpack-dev-server --host 0.0.0.0 --inline --progress --config build/webpack.dev.conf.js"
```
4.将项目运行起来 直接访问 localhost:8080即可访问你的vue项目了
```shell
docker-compose up
```
5.如果需要安装依赖，请输入命令,安装新的依赖请在后面跟上包名即可
```
docker-compose run --rm web npm install [package]
```
