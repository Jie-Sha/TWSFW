#!/usr/bin/env bash

#命令运行的前提是建立好'linuxrufxliqq/'、'linuxrufxliqq_build/'、'/tmp/vmount/'这些路径

cd camkes-vm-linuxrufxliqq_build/images/
sudo vmware-mount ~/vmware/seL4/seL4.vmdk /tmp/vmount/

sudo rm -rf /tmp/vmount/kernel-x86_64-pc99-app
sudo rm -rf /tmp/vmount/capdl-loader-image-x86_64-pc99-app

sudo cp kernel-x86_64-pc99 /tmp/vmount/kernel-x86_64-pc99-app
sudo cp capdl-loader-image-x86_64-pc99 /tmp/vmount/capdl-loader-image-x86_64-pc99-app
sudo vmware-mount -d /tmp/vmount/

vmrun -T ws start  ~/vmware/seL4/seL4.vmx
sleep 1s 

socat -d -d UNIX-CONNECT:/tmp/vsock0 PTY 
#minicom -D /dev/pts/6 -b 9600

#vmrun stop ~/vmware/seL4/seL4.vmx

