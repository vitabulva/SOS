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

# Remove temp files
rm -rfv /var/cache/*

# Remove manual pages and documentation files
rm -rfv /usr/share/doc/
rm -rfv /usr/share/man/
rm -rfv /usr/share/info

# Determine the system language
system_lang=$(locale | cut -f2 -d= | cut -f1 -d. | head -n 1)

# Remove unused localizations
for target in $(find /usr/share/locale -maxdepth 1 -not -name "$system_lang*"); do
    rm -fv "$target/LC_MESSAGES/*"
done

# Define a function to remove multiple files
function remove {
    for target in "$@"; do
        rm -fv "$target"
    done
}

DIR1=$HOME/all_modules.txt
DIR2=$HOME/current_modules.txt

find /lib/modules/$(uname -r) -type f -name '*.ko*' > "$DIR1"

# Finds modules that are not loaded into the kernel and deletes them

for module in $(lsmod | cut -f1 -d" " | tail -n +2); do
    filename=$(modinfo "$module" -n)
    echo "$filename" >> "$DIR2"
done

sort "$DIR1" | uniq > file1.sorted
sort "$DIR2" | uniq > file2.sorted

remove $(comm -23 file1.sorted file2.sorted)

remove $(find /usr/lib/firmware -atime +2)

find /boot -maxdepth 1 -type f -name '*rescue*' -delete
grub-mkconfig -o /boot/grub/grub.cfg
startx

modules_to_keep=("vboxsf"
"vmwgfx"
"drm_ttm_helper"
"snd_pcm"
"ttm"
"snd_timer"
"drm_kms_helper"
"snd"
"soundcore"
"video"
"vboxguest"
"wmi"
"drm"
"configfs"
"fuse"
"autofs4"
"ext4"
"crc16"
"mbcache"
"jbd2"
"sd_mod"
"t10_pi"
"crc64_rocksoft"
"crc64"
"crc_t10dif"
"ahci"
"libahci"
"libata"
"crct10dif_pclmul"
"crct10dif_common"
"crc32c_intel"
"scsi_mod"
"evdev"
"scsi_common")

# Directory where modules are stored
modules_directory="/lib/modules/$(uname -r)/kernel/"

# Remove all modules except those in the "modules_to_keep" list
for module_file in $(find "$modules_directory" -type f -name "*.ko"); do
    module_name=$(basename "$module_file" .ko)
    if [[ ! " ${modules_to_keep[@]} " =~ " ${module_name} " ]]; then
        echo "Removing $module_file"
        rm "$module_file"
    fi
done

echo "Module cleanup complete."

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
    
   # "ifupdown"
   # "fontconfig-config"
   # "fonts-dejavu-core"
   # "iproute2"
    #"isc-dhcp-common"
    #"iputils-ping"
    #"ispell"
    #"wireless-regdb"
    #"wireless-tools"
    #"vim-tiny"
    #"vim-common"
    #"libfontconfig1"
    #"libfontenc1"
    #"nano"
    #"wamerican"
    #"nftables"
    #"netbase"
    #"keyboard-configuration"
    #"less"
    #"installation-report"
    #"fdisk"
    #"pciutils"
    #"pci.ids"
    #"os-prober"
    #"usbutils"
)

for package in "${packages_to_remove[@]}"; do
    echo "Removing package: $package"
    apt-get remove --purge -y "$package"
done

echo "Cleanup complete."

rm -rfv /usr/lib/x86_64-linux-gnu/libLLVM-15.so.1
rm -rfv /var/lib/apt
rm -rfv /var/log
rm -rfv /var/lib/apt
rm -rfv /var/cache
