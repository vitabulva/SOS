## Used lsmod to see all loaded modules, put them here, put rmmod before all, commented out the ones which seemed important
## Dunno if it worked. Had to use it a few times. Bit of chaos. Probably no efficient

rmmod hid_generic         
rmmod usbhid              
rmmod hid                 
rmmod intel_rapl_msr      
rmmod intel_rapl_common   
rmmod crc32_pclmul        
rmmod ghash_clmulni_intel 
rmmod sha512_ssse3        
rmmod sha512_generic      
rmmod sha256_ssse3        
rmmod sha1_ssse3          
rmmod snd_intel8x0        
rmmod snd_ac97_codec      
rmmod ac97_bus            
# rmmod vmwgfx            
rmmod sr_mod              
# rmmod drm_ttm_helper    
rmmod cdrom               
rmmod ohci_pci            
# rmmod snd_pcm           
rmmod ttm                 
rmmod ohci_hcd            
rmmod ata_generic         
rmmod snd_timer           
rmmod ehci_pci            
rmmod ehci_hcd            
rmmod joydev              
rmmod aesni_intel         
rmmod snd                 
rmmod e1000               
rmmod crypto_simd         
rmmod drm_kms_helper      
rmmod cryptd              
rmmod sg                  
# rmmod soundcore         
rmmod ata_piix            
# rmmod vboxguest         
rmmod usbcore             
rmmod usb_common          
# rmmod video             
rmmod pcspkr              
rmmod i2c_piix4           
rmmod ac                  
# rmmod wmi               
rmmod battery             
rmmod button              
# rmmod drm               
# rmmod fuse              
rmmod efi_pstore          
# rmmod loop              
rmmod dm_mod              
# rmmod configfs          
rmmod ip_tables           
rmmod x_tables            
# rmmod autofs4           
# rmmod ext4              
# rmmod crc16             
# rmmod mbcache           
# rmmod jbd2              
rmmod crc32c_generic      
# rmmod sd_mod            
# rmmod t10_pi            
# rmmod crc64_rocksoft    
# rmmod crc64             
# rmmod crc_t10dif        
rmmod crct10dif_generic   
# rmmod ahci              
# rmmod libahci           
# rmmod libata            
# rmmod scsi_mod          
# rmmod crct10dif_pclmul  
# rmmod crct10dif_common  
# rmmod crc32c_intel      
rmmod psmouse             
# rmmod evdev             
rmmod serio_raw           
# rmmod scsi_common       

rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/accessibility
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/android
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/bluetooth
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/cdrom
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/firewire
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/hid
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/net
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/nfc
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/nvme
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/power
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/powercap
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/soundwire
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/thermal
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/thunderbolt
rm -rfv /lib/modules/6.1.0-15-amd64/kernel/drivers/usb