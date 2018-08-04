#!/bin/bash
set -xe

SCRIPT_DIR=$(cd `dirname ${0}`; pwd)
IMAGES_DIR=$(realpath ${SCRIPT_DIR}/../../output/images/)

qemu-system-aarch64 \
	-M raspi3 \
	-D qemu.log \
	-kernel ${IMAGES_DIR}/Image \
	-initrd ${IMAGES_DIR}/rootfs.cpio \
	-dtb ${IMAGES_DIR}/bcm2837-rpi-3-b.dtb \
	-m 1024 \
	-append "rw earlycon=pl011,0x3f201000 console=ttyAMA0 loglevel=8 fsck.repair=yes net.ifnames=0 rootwait memtest=1" \
	--nographic

	# -initrd ${IMAGES_DIR}/rootfs.cpio \
	# -append "root=/dev/mmcblk0p2 rootfstype=ext4 rw terminal=ttyS0 rootwait" \
	# -append "console=ttyAMA0" \
	# -drive file=${IMAGES_DIR}/rootfs.ext2,if=sd,format=raw \
