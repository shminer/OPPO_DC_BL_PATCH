#!/system/bin/sh

MODDIR=${0%/*}

until [ $(getprop sys.boot_completed) -eq 1 ]; do
  sleep 5
done
PATHED_BIN=${MODDIR}/bin/vendor.oplus.hardware.displaypanelfeature@1.0-service
# PATHED_BIN=/data/adb/modules/DC_LIGHT_PATCH/bin/vendor.oplus.hardware.displaypanelfeature@1.0-service
BIND_BIN=/odm/bin/hw/vendor.oplus.hardware.displaypanelfeature@1.0-service
echo "-- Bind HIDL service"
mount --bind  $PATHED_BIN $BIND_BIN
echo "-- Set SElinux context"
chcon u:object_r:oppo_hal_displaypanelfeature_exec:s0 /odm/bin/hw/vendor.oplus.hardware.displaypanelfeature@1.0-service
echo "-- Set UID and GID"
chown root:shell /odm/bin/hw/vendor.oplus.hardware.displaypanelfeature@1.0-service
chmod 0755 /odm/bin/hw/vendor.oplus.hardware.displaypanelfeature@1.0-service

echo "-- Get SElinux status"
RET=$(getenforce)
if [ $RET == "Enforcing" ];then 
	SEEN=1
	echo "-- SElinux in Enforcing mode"
else
	SEEN=0
	echo "-- SElinux is Permissive mode"
fi

echo "-- SElinux change to Permissive mode"
setenforce 0
sleep 1
stop displaypanelfeature-1-0 && start displaypanelfeature-1-0
sleep 3

#echo "-- Lock kernel"
HBMPATH=/sys/kernel/oplus_display/dimlayer_hbm
echo 1 > $HBMPATH
# chmod 0000 $HBMPATH

echo "-- Restore SElinux mode"
setenforce $SEEN
echo "-- All done"
exit 0