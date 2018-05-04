How to Build
------------
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
Increase Swapfile for build process
-----------------------------------

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

Built packages can be found at Anaconda Cloud repository: https://anaconda.org/domosute/repo
