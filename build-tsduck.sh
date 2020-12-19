#!/usr/bin/env bash
source $(dirname $0)/include.sh

TSROOT=$(dirname $SCRIPTDIR)/tsduck

[[ -d $GCCBIN ]] || error "directory $GCCBIN not found"
[[ -d $GCCLIB ]] || error "directory $GCCLIB not found"
[[ -d $TSROOT ]] || error "directory $TSROOT not found"

make -C $TSROOT BINDIR_SUFFIX=-gcc-$GCCVERSION NOSRT=1 \
     CPP=$GCCBIN/cpp CC=$GCCBIN/gcc GCC=$GCCBIN/gcc CXX=$GCCBIN/g++ LD=$GCCBIN/gcc AR=$GCCBIN/gcc-ar \
     LDFLAGS_EXTRA="-L$GCCLIB -Wl,-rpath,$GCCLIB '-Wl,-rpath,\$\$ORIGIN'" \
     -j10 test
