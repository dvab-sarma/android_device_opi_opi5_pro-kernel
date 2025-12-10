setenv load_addr "0x9000000"
echo ${devtype}
echo ${devnum}
echo ${prefix}
load ${devtype} ${devnum} ${load_addr} ${prefix}config.txt
env import -t ${load_addr} ${filesize}

load mmc 0:1 ${kernel_addr_r} /Image
load mmc 0:1 ${fdt_addr_r} /${fdtfile}

if test "${recovery}" = "true"; then
    echo "Booting into Recovery...."
    load mmc 0:1 ${fdtoverlay_addr_r} /${fdtoverlay}
    fdt addr ${fdt_addr_r}
    fdt resize
    fdt apply ${fdtoverlay_addr_r}
    load mmc 0:1 ${ramdisk_addr_r} /uRecovery
else
    echo "Booting into normal Android...."
    load mmc 0:1 ${ramdisk_addr_r} /uRamdisk
fi;


setenv bootargs "loglevel=8 earlycon=uart8250,mmio32,0xfeb50000 console=ttyS2,1500000 root=/dev/ram0 rootwait androidboot.hardware=opi5 androidboot.selinux=permissive"
booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}