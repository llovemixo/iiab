#!/bin/bash

# Thanks to Jerry Vonau (https://github.com/jvonau) who made this critical
# breakthrough possible!
#
# Worked up to Calibre 3.23 from May 2018.
# Calibre 3.24 and 3.25 fail to "apt install" in June 2018:
#
#   The following packages have unmet dependencies:
#    calibre : Depends: python-pyqt5 (>= 5.10.1+dfsg-2) but 5.10.1+dfsg-1+rpi1 is to be installed
#   E: Unable to correct problems, you have held broken packages.
#
# Debian approach (calibre-install-latest.sh) is the workaround for now:
#
#   https://github.com/iiab/iiab/pull/833
# 
# Calibre 3.25 is the latest available from testing as of 2018-06-10:
#
#   http://raspbian.raspberrypi.org/raspbian/pool/main/c/calibre/
#   http://archive.raspbian.org/raspbian/pool/main/c/calibre/
#   https://packages.debian.org/search?keywords=calibre
#   http://deb.debian.org/debian/pool/main/c/calibre/
#
# Might break future updates; you have been warned.

export DEBIAN_FRONTEND=noninteractive
# Prepares to update to latest from testing
echo "deb http://raspbian.raspberrypi.org/raspbian/ testing main" > /etc/apt/sources.list.d/rpi-testing.list
apt update
apt -y install calibre calibre-bin
# Removes last line, safer than: rm /etc/apt/sources.list.d/rpi-testing.list
sed -i '$ d' /etc/apt/sources.list.d/rpi-testing.list
# Clears the cache of testing
apt update