# Rust Builder 镜像

## Features

1. 基于`rust`官方构建镜像；
1. 仓库crates.io使用中国科技大学的镜像[http://mirrors.ustc.edu.cn/help/crates.io-index.html](http://mirrors.ustc.edu.cn/help/crates.io-index.html)；
1. 仓库debian10.x（buster）使用腾讯云镜像[https://mirrors.tencent.com/help/debian.html](https://mirrors.tencent.com/help/debian.html)；
1. 安装musl-dev,musl-tools依赖；
1. 安装libpq-dev,libsqlite-dev依赖；
1. 安装libssl-dev依赖；
1. 安装linux-libc-dev依赖；

## Changelogs

### 1.66.0-slim-buster