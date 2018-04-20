#! /bin/bash

SCRIPT_PATH=`readlink -f $0`
SCRIPT_DIR=`dirname $SCRIPT_PATH`
BR_TOP_DIR=`readlink -f $SCRIPT_DIR/../..`
ZIMAGE=$BR_TOP_DIR/output/images/bzImage
INITRD=$BR_TOP_DIR/output/images/rootfs.cpio
QEMU=qemu-system-x86_64
USB_DEVICE1=vendorid=0x13b1,productid=0x0042
USB_DEVICE2=vendorid=0x0cf3,productid=0x9271

${QEMU} \
	-kernel ${ZIMAGE}					\
	-initrd ${INITRD}					\
	-usb								\
	-device usb-ehci,id=ehci			\
	-device usb-host,${USB_DEVICE1}		\
	-device usb-host,${USB_DEVICE2}		\
	-enable-kvm							\
	-append "console=ttyS1 nokaslr"		\
	-m 1536								\
	-nographic							\
	-s									\
	-S
