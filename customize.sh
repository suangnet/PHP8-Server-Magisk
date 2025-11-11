#!/system/bin/sh

ui_print "********************************"
ui_print "* PHP 8.4 Server (Standalone)  *"
ui_print "* Module by suangnet           *"
ui_print "********************************"
ui_print " "

ui_print "Installing to: $MODPATH"
ui_print "Set permission files..."

set_perm_recursive $MODPATH 0 0 0755 0644

set_perm_recursive $MODPATH/bin 0 0 0755 0755

if [ -f "$MODPATH/service.d/php8_service.sh" ]; then
  set_perm $MODPATH/service.d/php8_service.sh 0 0 0755
fi

ui_print "Permissions for executable file have been set."
ui_print " "
ui_print "[100] Finish!"
ui_print "Reboot to start server."
ui_print "Bug & support: https://t.me/suangnet"