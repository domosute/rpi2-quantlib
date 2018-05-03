#!/bin/bash

set -x -e

PREFIX=/opt/conda
PYTHON=/opt/conda/bin/python
PY_VER=3.6
ARCH_ADDR=32
ARCH=armv7l

INCLUDE_PATH="${PREFIX}/include"
LIBRARY_PATH="${PREFIX}/lib"


./bootstrap.sh \
   --prefix="${PREFIX}" \
   --with-python="${PYTHON}" \
   --with-python-root="${PREFIX} : ${PREFIX}/include/python${PY_VER}m ${PREFIX}/include/python${PY_VER}" \
   --with-icu="${PREFIX}" \
   | tee bootstrap.log 2>&1

./b2 -q \
   variant=release \
   address-model="${ARCH_ADDR}" \
   architecture="${ARCH}" \
   debug-symbols=off \
   threading=multi \
   runtime-link=shared \
   link=static,shared \
   toolset=gcc \
   python="${PY_VER}" \
   include="${INCLUDE_PATH}" \
   linkflags="-L${LIBRARY_PATH}" \
   --layout=system \
   -j"${CPU_COUNT}" \
   install | tee b2.log 2>&1
