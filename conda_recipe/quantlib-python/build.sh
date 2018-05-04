#!/bin/bash

CPU_COUNT=2 # Adjust less if memory error occurs during gcc compilation.

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

./autogen.sh
./configure --prefix=$PREFIX
make -j ${CPU_COUNT} -C Python 
sudo make -C Python install
