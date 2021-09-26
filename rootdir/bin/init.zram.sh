#!/system/bin/sh

echo lz4 > /sys/block/zram0/comp_algorithm
echo 2048M > /sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0
