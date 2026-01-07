#!/system/bin/sh

ui_print "- Installing PHP Server Module..."

OLD_MOD_DIR="/data/adb/modules/php8"

if [ -d "$OLD_MOD_DIR/var" ]; then
    ui_print "- Detected previous version..."
    ui_print "- Backing up data (www, logs, tmp)..."
    
    cp -rf "$OLD_MOD_DIR/var" "$MODPATH/"
else
    ui_print "- Clean Install..."
fi

case $ARCH in
  arm|armeabi|armeabi-v7a)
    ui_print "- Detected Architecture: ARM (32-bit)"
    ARCH_DIR="arm"
    ;;
  arm64|aarch64|arm64-v8a)
    ui_print "- Detected Architecture: ARM64 (64-bit)"
    ARCH_DIR="arm64"
    ;;
  *)
    ui_print "! Error: Unsupported architecture: $ARCH"
    abort
    ;;
esac

ui_print "- Extracting files for $ARCH_DIR..."

if [ -d "$MODPATH/files/$ARCH_DIR" ]; then
    cp -af "$MODPATH/files/$ARCH_DIR/." "$MODPATH/"
    rm -rf "$MODPATH/files"
else
    abort "! Error: Source folder files/$ARCH_DIR missing!"
fi

ui_print "- Set permission files..."

set_perm_recursive $MODPATH 0 0 0755 0644

if [ -d "$MODPATH/var" ]; then
    set_perm_recursive $MODPATH/var 0 0 0777 0777
fi

if [ -d "$MODPATH/bin" ]; then
    set_perm_recursive $MODPATH/bin 0 0 0755 0755
fi

if [ -d "$MODPATH/lib" ]; then
    set_perm_recursive $MODPATH/lib 0 0 0755 0755
fi

if [ -f "$MODPATH/php_run" ]; then
    set_perm $MODPATH/php_run 0 0 0755
fi

if [ -d "$MODPATH/service.d" ]; then
    ui_print "- Installing Service Script..."
    mkdir -p /data/adb/service.d
    
    if [ -f "$MODPATH/service.d/php8_service.sh" ]; then
        mv -f $MODPATH/service.d/php8_service.sh /data/adb/service.d/php8_service.sh
        set_perm /data/adb/service.d/php8_service.sh 0 0 0755
    fi
    rm -rf $MODPATH/service.d
fi

ui_print "- Installation complete!"
ui_print "- Reboot to start PHP server."
ui_print "- Support: https://t.me/suangnet"
