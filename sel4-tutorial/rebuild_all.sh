#!/usr/bin/env bash

#命令运行的前提是建立好'linuxrufxliqq/'、'linuxrufxliqq_build/'、'/tmp/vmount/'这些路径

rm -rf camkes-vm-linuxrufxliqq_build/*
python projects/sel4-tutorials/hello.py
cd camkes-vm-linuxrufxliqq_build/
ninja


