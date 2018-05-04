#!/bin/bash

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

./autogen.sh
./configure --prefix=$PREFIX
# make -j 4 -C Pyhton  # This works for x86_64
make -C Python # Multi-Threading process caused memory error under RPi3 B+; thus, set to single thread.
sudo make -C Python install
