load mmc 0:1 ${kernel_addr_r} /Image
load mmc 0:1 ${fdt_addr_r} /rk3588s-orangepi-5-pro-1.dtb
load mmc 0:1 ${ramdisk_addr_r} /uRamdisk

setenv bootargs "loglevel=8 earlycon=uart8250,mmio32,0xfeb50000 console=ttyS2,1500000 root=/dev/ram0 rootwait androidboot.hardware=opi5 androidboot.selinux=permissive"
booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}
