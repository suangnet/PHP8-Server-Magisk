#!/system/bin/sh

# Wait system to fully boot
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done

# Wait system ready
sleep 4

# Path script
MODULE_DIR="/data/adb/modules/php8"
PHP_RUN_SCRIPT="/data/adb/modules/php8/bin/php_run"

# Start PHP 8.4 service
if [ -f "$PHP_RUN_SCRIPT" ]; then
    $PHP_RUN_SCRIPT -s
fi

# Start file watcher
if [ -f "$MODULE_DIR/bin/inotifyd" ]; then
    $MODULE_DIR/bin/inotifyd $MODULE_DIR/bin/php_inotifyd $MODULE_DIR >> /dev/null &
fi