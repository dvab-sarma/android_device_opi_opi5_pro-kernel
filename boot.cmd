setenv load_addr "0x9000000"
setenv boot_device "mmc"
setenv boot_devnum "0"
setenv boot_partnum "1"
setenv root_partnum "2"
setenv prefix "/"

load ${devtype} ${devnum} ${load_addr} ${prefix}config.txt
env import -t ${load_addr} ${filesize}

load ${boot_device} ${boot_devnum}:${boot_partnum} ${kernel_addr_r} ${prefix}Image
load ${boot_device} ${boot_devnum}:${boot_partnum} ${fdt_addr_r} ${prefix}${fdtfile}

if test "${recovery}" = "true"; then
    echo "Booting into Recovery...."
    load ${boot_device} ${boot_devnum}:${boot_partnum} ${fdtoverlay_addr_r} /${fdtoverlay}
    fdt addr ${fdt_addr_r}
    fdt resize
    fdt apply ${fdtoverlay_addr_r}
    load ${boot_device} ${boot_devnum}:${boot_partnum} ${ramdisk_addr_r} /uRecovery
else
    echo "Booting into normal Android...."
    load ${boot_device} ${boot_devnum}:${boot_partnum} ${ramdisk_addr_r} /uRamdisk
fi;


part uuid ${boot_device} ${boot_devnum}:${root_partnum} partuuid

setenv bootargs "loglevel=8 earlycon=uart8250,mmio32,0xfeb50000 console=ttyS2,1500000 root=/dev/ram0 rootwait pcie_aspm=off pcie_port_pm=off nvme_core.default_ps_max_latency_us=0 androidboot.boot_part_uuid=${partuuid} androidboot.hardware=opi5 androidboot.selinux=permissive"

booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}