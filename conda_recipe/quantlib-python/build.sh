#!/bin/bash

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

./autogen.sh
./configure --prefix=$PREFIX
make -j 2 -C Python # Adjust "-j CPU_COUNT" if memory error occurs during gcc compilation.
sudo make -C Python install
