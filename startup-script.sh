#!/bin/bash
set -ex

mkdir -p /home/lazycat/lzc-home

# 映射权限：详细请看：https://github.com/brauner/mount-idmapped
sudo /home/lazycat/mount-mappied --map-mount b:0:1000:1 /lzcapp/run/mnt/home /home/lazycat/lzc-home

# 映射对应目录到桌面
ln -svfn /lzcapp/var '/home/lazycat/Desktop/本应用数据(支持读写)'
ln -svfn /home/lazycat/lzc-home '/home/lazycat/Desktop/懒猫网盘数据(支持读写，请谨慎操作)'
