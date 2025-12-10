AOSP 16 device Kernel files for Orangepi 5 Pro.

The project supports booting from NVME, USB, SD-card, EMMC.


In config.txt file, change the value(s) as follows

To select the desired boot device - 

for sdcard - 
boot_device=mmc
boot_devnum=0

for emmc - 
boot_device=mmc
boot_devnum=1

for NVME - 
boot_device=nvme
boot_devnum=0

for USB - 
boot_device=usb
boot_devnum=0

NOTE - For some boards, the value of boot_devnum might be different. Please select the boot_devnum respective to their board config.

By default, The selected boot device is SD-Card.

Don't mind the .disabled files, these are just from previous builds. Kept for reference.

To select for another board, Just change the value of fdtfile to their respective board's .dtb file.

If want to boot into TWRP recovery, Just change the value of recovery from false to true.

Note -  TWRP recovery has a bug where it boots fine in the background but doesnt show the image on the screen. The fix for it is just reconnect the hdmi.

Not working -

Camera
3.5 mm audio

Working -

everything else including vulkan.

This project can be ported to any device which utilises Rockchip SoC with minor changes.

any doubts, feel free to mail me at vdarbha0473@gmail.com
