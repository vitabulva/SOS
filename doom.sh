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
export DOOMWADDIR=/root/DOOM/DOOM/linuxdoom-1.10/linux
export DISPLAY=:1
cd $DOOMWADDIR
./linuxxdoom
' > /root/.xinitrc

startx
#function to remove packages
packages_to_remove=(
    "xfonts-base"
    "xfonts-utils"
    "anacron"
    "apparmor"
    "avahi-autoipd"
    "bluetooth"
    "bluez"
    "dictionaries-common"
    "eject"
    "iamerican"
    "ibritish"
    "ienglish-common"
    "ifupdown"
    "fontconfig-config"
    "fonts-dejavu-core"
    "iproute2"
    "isc-dhcp-common"
    "iputils-ping"
    "ispell"
    "wireless-regdb"
    "wireless-tools"
    "vim-tiny"
    "vim-common"
    "libfontconfig1"
    "libfontenc1"
    "nano"
    "wamerican"
    "nftables"
    "netbase"
    "keyboard-configuration"
    "less"
    "installation-report"
    "fdisk"
    "pciutils"
    "pci.ids"
    "os-prober"
    "usbutils"
)

for package in "${packages_to_remove[@]}"; do
    echo "Removing package: $package"
    apt-get remove --purge -y "$package"
done

echo "Cleanup complete."
