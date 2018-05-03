How to Build
------------
Under conda environment, execute the following;
``` 
conda build .
```
Package Build Dependency
------------
```
QuantLib-Python
 +- python
 +- swig
     +- pcre
         +- zlib
         +- bzip2
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
```        
Built package can be found at Anaconda Cloud repository: https://anaconda.org/domosute/repo
