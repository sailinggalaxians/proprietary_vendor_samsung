#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13d60000.ufs/by-name/recovery:67633152:c1d5f1a2b6fcfc2b27812890b3176d6b5c634c8f; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13d60000.ufs/by-name/boot:57671680:2120d71e8eb7fc10401c00db5e952db8f55e0a1f \
          --target EMMC:/dev/block/platform/13d60000.ufs/by-name/recovery:67633152:c1d5f1a2b6fcfc2b27812890b3176d6b5c634c8f && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
