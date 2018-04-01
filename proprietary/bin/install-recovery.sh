#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 15308800 2f10f7a81a43c4477bbb0236889875a02f9b00ab 9064448 c385b6ad40107b71a47053e3421d99c6532c8179
fi
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:15308800:2f10f7a81a43c4477bbb0236889875a02f9b00ab; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:9064448:c385b6ad40107b71a47053e3421d99c6532c8179 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 2f10f7a81a43c4477bbb0236889875a02f9b00ab 15308800 c385b6ad40107b71a47053e3421d99c6532c8179:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
