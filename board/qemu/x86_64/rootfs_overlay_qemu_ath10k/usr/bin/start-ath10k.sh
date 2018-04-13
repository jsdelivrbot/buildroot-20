#! /bin/sh

modprobe ath10k_usb.ko
sleep 2

ip link set wlan0 up
sleep 2

wpa_supplicant -B -Dnl80211 -iwlan0 -c /etc/wpa_supplicant.conf
sleep 2

udhcpc -i wlan0
sleep 1
