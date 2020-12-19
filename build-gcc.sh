#!/usr/bin/env bash
source $(dirname $0)/include.sh

[[ -d gcc-$GCCVERSION-$TARGET ]] || error "directory gcc-$GCCVERSION-$TARGET not found"

cd gcc-$GCCVERSION-$TARGET
mkdir -p BUILD
cd BUILD

export CFLAGS="-O2 -w -march=native -pipe"
export CXXFLAGS="$CFLAGS"

../configure --enable-shared --enable-threads=posix --disable-stage1-checking \
    --with-system-zlib --enable-__cxa_atexit --enable-multilib --with-gnu-as \
    --with-gnu-ld --enable-languages="c,c++" --without-x --prefix=$GCCROOT \
    --disable-libunwind-exceptions

make -j10 && make install
