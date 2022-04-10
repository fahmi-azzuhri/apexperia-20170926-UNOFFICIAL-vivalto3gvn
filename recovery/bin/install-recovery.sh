#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8132608 7ee8895ade6ebb4ffee61c90a2d3215b739f8fbe 5855232 a0bb1b8509d2654bad7d286a7e5313d219b75008
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p6:8132608:7ee8895ade6ebb4ffee61c90a2d3215b739f8fbe; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p5:5855232:a0bb1b8509d2654bad7d286a7e5313d219b75008 EMMC:/dev/block/mmcblk0p6 7ee8895ade6ebb4ffee61c90a2d3215b739f8fbe 8132608 a0bb1b8509d2654bad7d286a7e5313d219b75008:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
