Preparing Build Environment
------------
Building Quantlib and Quantlib-python package with Raspberry Pi platform fail due to scares of memory resource.  Rather than tweaking swapfile size or limiting multi-threading process, building was done on emulation enviornment under x86_64 platform with qemu.

Reference: https://qiita.com/autch/items/c8c9cdc7b8e5821e81a4

1. Setup Ubuntu host:
- Obtain [Ubuntu 16.04 LTS (Xenial Xerus) Netboot]`http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/` and bring up host.




Under conda environment, execute the following;
``` 
conda build .
```
Package Build Dependency
------------
QuantLib/QuantLib-Python have package dependency which must be resolved prior to the installation of QuantLib/QuantLib-Python. 

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
Adjust Swapfile Setting for Build Process
-----------------------------------------

Verified build with Raspberry Pi 3 B+. `[Note]: Swapfile need to be increased to pass the process.`

Edit 2 parameters of /etc/dphys-swapfile. (Example: set swap file size to 8GB)

```
CONF_SWAPSIZE=8192
CONF_MAXSWAP=8192
```

Then, update

```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
Package Repo Info
-----------------

Built packages can be found at Anaconda Cloud repository: https://anaconda.org/domosute/repo
