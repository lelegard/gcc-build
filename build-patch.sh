#!/usr/bin/env bash
source $(dirname $0)/include.sh

[[ -d gcc-$GCCVERSION ]] || error "directory gcc-$GCCVERSION not found"
[[ -d gcc-$GCCVERSION-$TARGET ]] || error "directory gcc-$GCCVERSION-$TARGET not found"

diff -Nur \
     -x BUILD -x '.*.tar.bz2' \
     -x mpc  -x 'mpc-[.0-9]*' \
     -x mpfr -x 'mpfr-[.0-9]*' \
     -x gmp  -x 'gmp-[.0-9]*' \
     -x isl  -x 'isl-[.0-9]*' \
     gcc-$GCCVERSION \
     gcc-$GCCVERSION-$TARGET \
     >gcc-$GCCVERSION-$TARGET.patch
