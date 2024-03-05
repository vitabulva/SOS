#!/bin/bash

# More efficient version of the nuke. Probably the only thing worth anything from today
# I used lsmod to see which ones were loaded, unloaded ones which werent used by any other module and this is what remained
# We will keep these
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
