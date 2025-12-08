#!/system/bin/sh

ui_print "- Install to: $MODPATH"
ui_print "- Set permission files..."

set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive $MODPATH/bin 0 0 0755 0755

mv $MODPATH/service.d/php8_service.sh /data/adb/service.d/php8_service.sh
set_perm /data/adb/service.d/php8_service.sh 0 0 0755
rmdir $MODPATH/service.d

ui_print "- Permission have been set"
ui_print " "
ui_print "[100] Finish!"
ui_print "Reboot to start server"
ui_print "Support: https://t.me/suangnet"
ui_print " "