#!/bin/bash
#change these variables to own

DOOMPATH=/root/DOOM/  		#cesta k doom, kde bude uložen
DISK=$1				#druh pripojeni virtdisku vbox=> "vboxsf" qemu "virtiofs"
MOUNTDISK=$2			#název sharedfolder moje je "mount_disk"

apt-get update
apt-get install -y xinit xterm
apt-get install --no-install-recommends -y xserver-xephyr

mkdir -p $DOOMPATH
mount -t $DISK $MOUNTDISK $DOOMPATH

#vytvoreni scriptu ktery se spusti se startx
cat <<< '				
Xephyr :1 -ac -screen 640x480x8 &
sleep 2
export DOOMWADDIR=/root/DOOM/linuxdoom-1.10/linux
export DISPLAY=:1
cd $DOOMWADDIR
./linuxxdoom
' > /root/.xinitrc

startx
