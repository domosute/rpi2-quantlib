#!/bin/bash

MULTI_THREAD=2 # Adjust it to less if memory error occurs during build.

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

./autogen.sh
./configure --prefix=$PREFIX
make -j ${MULTI_THREAD} -C Python 
sudo make -C Python install
