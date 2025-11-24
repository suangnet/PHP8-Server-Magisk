# PHP 8.4 Server for Magisk

![Magisk](https://img.shields.io/badge/Magisk-Module-green) ![PHP](https://img.shields.io/badge/PHP-8.4.2-blue) ![License](https://img.shields.io/badge/License-MIT-orange)

A standalone, lightweight, and fully functional PHP 8.4 Web Server module for Android, powered by Magisk.
Run PHP scripts and host local websites on your device without the need for Termux or third-party apps running in the background.

## 🌟 Features

- **Latest PHP Version:** Includes pre-compiled PHP **8.4.2** binary.
- **Standalone:** Runs independently with its own libraries (Libcurl, OpenSSL, Zip, GD, Opcache, etc.). No Termux installation required.
- **Auto-Start:** Automatically starts the server on system boot.
- **Optimized:** Pre-configured `php.ini` for mobile performance (Zend Opcache enabled).
- **Root Access:** Runs with root privileges (via Magisk), allowing system-level script execution.

## 📋 Requirements

- Rooted Android Device (Android 7.0+)
- **Magisk Manager** (Magisk v20.4 or newer)
- **Busybox for Android NDK** module installed (Required for script execution)

## 📦 Installation

1.  Download the latest `php8.zip` release.
2.  Open **Magisk Manager**.
3.  Go to the **Modules** tab.
4.  Tap **"Install from storage"** and select the zip file.
5.  Reboot your device.

The server will start automatically after the boot animation finishes.

## ⚙️ Configuration & Paths

After installation, the module resides in `/data/adb/modules/php8/`.

| Item                     | Path                                      |
| :----------------------- | :---------------------------------------- |
| **Web Root (htdocs)**    | `/data/adb/modules/php8/var/www/`         |
| **PHP Config (php.ini)** | `/data/adb/modules/php8/etc/php.ini`      |
| **Log Files**            | `/data/adb/modules/php8/var/log/`         |
| **Binary & Scripts**     | `/data/adb/modules/php8/bin/`             |
| **Access URL**           | `http://127.0.0.1:80` (or your device IP) |

> **Note:** To edit files, use a root explorer (like MT Manager or Mixplorer) or terminal via `su`.

## 🛠️ Manual Usage (Terminal)

You can control the server manually using `su` via Terminal (Termux/ADB):

**Start Server:**

````bash
/data/adb/modules/php8/bin/php_run -s

**Stop Server:**
```bash
/data/adb/modules/php8/bin/php_run -k

**Restart Server:**
```bash
/data/adb/modules/php8/bin/php_run -r

## 📜 License

This project is a bundle of software with different licenses:

* **Module Scripts** (php_run, service.d, etc.) are licensed under the MIT License.
* **PHP Binary & Extensions** are licensed under the PHP License v3.01.
* **Libraries** (libcurl, openssl, etc.) are copyright of their respective owners.

## 🤝 Credits

* **PHP Group** - For the PHP source.
* **Termux** - For the build environment and libraries.
* **Busybox NDK** - For the underlying shell utilities.
* **Magisk** - For the module system.
````
