[Note]: QuantLib/QuantLib-Python have package dependency which must be resolved prior to the installation of QuantLib/QuantLib-Python. 

How to Build
------------
Under conda environment, execute the following;
``` 
conda build .
```
Package Build Dependency
------------
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
Built packages can be found at Anaconda Cloud repository: https://anaconda.org/domosute/repo
