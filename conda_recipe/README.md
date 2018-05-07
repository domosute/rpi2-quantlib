Preparing Build Environment
------------
Building Quantlib and Quantlib-python package on Raspberry Pi platform failed due to the scares of memory resource.  Rather than tweaking swapfile size or limiting multi-threading with "-j 1" switch, building was done on emulation enviornment under x86_64 platform with qemu.

Reference(Japanese): [Create self-build enviornment for Raspberry Pi with using qemu](https://qiita.com/autch/items/c8c9cdc7b8e5821e81a4)

1. Setup Ubuntu host:
- Obtain [Ubuntu 16.04 LTS (Xenial Xerus) Netboot](http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/) and bring up.  Below was the VM created for ESXi host. Adjust resorce accordingly.
```
- vCPU: 6
- Memory: 16GB
- Storage: 40GB
```
2. Login and download [Raspbian Stretch image](https://downloads.raspberrypi.org/raspbian_lite_latest).  (2018-04-18-raspbian-stretch.img was installed on /opt directory)
3. Attaching image to loopback device
```
$ sudo su
# cd /opt
# losetup -frP 2018-04-18-raspbian-stretch.img
```
4. Checking with fdisk
```
# fdisk -l /dev/loop0
Disk /dev/loop0: 4.6 GiB, 4953473024 bytes, 9674752 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x9cba179a

Device       Boot Start     End Sectors  Size Id Type
/dev/loop0p1       8192   96453   88262 43.1M  c W95 FAT32 (LBA)
/dev/loop0p2      98304 9674751 9576448  4.6G 83 Linux
```
5. Mount loop0p2 to /mnt, and create tarball.
```
# mount -o ro /dev/loop0p2 /mnt
# tar jcvf raspbian-stretch-lite.tar.bz2 -C /mnt .
```
6. Once the tarball is made, unmount and detatch loopback device.
```
# umount /mnt
# losetup -D
```
7. Create directory and untar the created tarball.
```
# mkdir /opt/armv7l
# tar jxvf /opt/raspbian-stretch-lite.tar.bz2 /opt/armv7l
```
8. Install QEMU usermode emulator.  Confirm executable path.
```
# apt-get install  qemu-user-static
# update-binfmts --display | grep arm
qemu-arm (enabled):
 interpreter = /usr/bin/qemu-arm-static
qemu-armeb (enabled):
 interpreter = /usr/bin/qemu-armeb-static
```
9. Copy qemu-arm-static from host.
```
cp /usr/bin/qemu-arm-static /opt/armv7l/usr/bin
```
10. Mount /sys, /proc, and /dev from host. 
```
# mount -t sysfs sysfs /opt/armv7l/sys
# mount -t proc proc /opt/armv7l/proc
# mount -t devtmpfs udev /opt/armv7l/dev
# mount -t devpts devpts /opt/armv7l/dev/pts
# mount -v | grep armv7l
sysfs on /opt/armv7l/sys type sysfs (rw,relatime)
proc on /opt/armv7l/proc type proc (rw,relatime)
udev on /opt/armv7l/dev type devtmpfs (rw,relatime,size=8197596k,nr_inodes=2049399,mode=755)
devpts on /opt/armv7l/dev/pts type devpts (rw,relatime,mode=600,ptmxmode=000)
```
11. chroot into the directory extracted from tarball.
```
# chroot /opt/armv7l/ /bin/bash
# uname -a
Linux ubuntu 4.4.0-122-generic #146-Ubuntu SMP Mon Apr 23 15:34:04 UTC 2018 armv7l GNU/Linux
```
12. Install Berryconda
```
# cd /opt
# cd /opt && \
wget https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda3-2.0.0-Linux-armv7l.sh && \
chmod +x /opt/Berryconda3-2.0.0-Linux-armv7l.sh &&\
/opt/Berryconda3-2.0.0-Linux-armv7l.sh -b -p /opt/conda && \
/opt/conda/bin/conda update -y --prefix /opt/conda conda
```
13. clone this repo and start building packages.
``` 
# cd /opt
# git clone https://github.com/domosute/rpi2-quantlib.git
# cd rpi2-quantlib/conda_recipe/m4
# conda build .
```
Package Build Dependency
------------
QuantLib/QuantLib-Python have package dependency which must be resolved prior to the build of QuantLib/QuantLib-Python. 

```
QuantLib
 +- m4
 +- autoconf
 |   +- m4
 +- automake
 |   +- m4
 |   +- autoconf
 +- libtool
 |   +- autoconf
 |   +- automake
 +- boost
     +- icu
     +- bzip2
     +- zlib
     
 QuantLib-Python
 +- python
 +- swig
     +- pcre
         +- zlib
         +- bzip2
```

Package Repo Info
-----------------

Built packages can be found at Anaconda Cloud repository: https://anaconda.org/domosute/repo
