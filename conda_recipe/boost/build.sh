#!/bin/bash

set -x -e

# ADDR_MODEL=64
ADDR_MODEL=32
# ADDR_MODEL=x86
ARCH=arm

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
   address-model="${ADDR_MODEL}" \
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
