#!/system/bin/sh

# Wait system to fully boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

# Wait system ready
sleep 4

# Start PHP 8.4 service
$MODPATH/bin/php_run -s

# Start file watcher
if [ -f "$MODPATH/bin/inotifyd" ]; then
    # $1=skrip handler, $2=folder yang diawasi
    $MODPATH/bin/inotifyd $MODPATH/bin/php_inotifyd $MODPATH >> /dev/null &
fi