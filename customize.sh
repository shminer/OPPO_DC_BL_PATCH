#!/system/bin/sh
SKIPUNZIP=1

ui_print "- ONEPLUS 9 PRO DC backLight PATCH (HIDL VERSION)"
ui_print "- ONEPLUS 9 PRO DC 调光补丁(HIDL版)"
ui_print "- Not test on other ColorOS 12 version!!!"
ui_print "- For safety, Only flash on ColorOS 12 C.46!!!"
ui_print "- 未经其他COS12版本测试，请在非C.46版本上刷入!!!"
ui_print "--------------------------------------------------------"
ui_print "- All Rights Reserved by JZshminer."
ui_print "--------------------------------------------------------"

ui_print "- TEST SYSTEM VERSION."
getprop ro.build.display.id | grep "C.46" > /dev/null 2>&1 &
ret=$?
ui_print "- Your system version is $(getprop ro.build.display.id)"
if [ $ret -eq 1 ];then
	ui_print "- For safety, this version not tested, install canceled."
	ui_print "- 为了安全,此系统版本未经测试，安装取消."
	exit 1
fi
ui_print "--------------------------------------------------------"
ui_print "- Starting install."
mkdir -p $MODPATH/bin
unzip -j -o "${ZIPFILE}" "bin/vendor.oplus.hardware.displaypanelfeature@1.0-service" -d $MODPATH/bin >&2
unzip -j -o "${ZIPFILE}" 'service.sh' -d $MODPATH >&2
unzip -j -o "${ZIPFILE}" 'module.prop' -d $MODPATH >&2

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm  $MODPATH/bin/vendor.oplus.hardware.displaypanelfeature@1.0-service   0     2000    0755      u:object_r:oppo_hal_displaypanelfeature_exec:s0

ui_print "--------------------------------------------------------"
ui_print "- finished."


