#!/usr/bin/env bash
source $(dirname $0)/include.sh

[[ -d gcc-$GCCVERSION ]] && error "directory gcc-$GCCVERSION already exists"
[[ -d gcc-$GCCVERSION-$TARGET ]] && error "directory gcc-$GCCVERSION-$TARGET already exists"

TARBALL=gcc-$GCCVERSION.tar.bz2
PATCH=gcc-$GCCVERSION-$TARGET.patch
URL=https://ftp.gnu.org/gnu/gcc/gcc-$GCCVERSION/$TARBALL

if [[ ! -e $TARBALL ]]; then
    echo "Getting $URL ..."
    curl $URL -o $TARBALL
fi

echo "Expanding $TARBALL ..."
tar xf $TARBALL
mv gcc-$GCCVERSION gcc-$GCCVERSION-$TARGET

if [[ -e $PATCH ]]; then
    echo "Applying patch $PATCH ..."
    patch -d gcc-$GCCVERSION-$TARGET -p1 <$PATCH
fi

cd gcc-$GCCVERSION-$TARGET
echo "Downloading GCC prerequisites ..."
contrib/download_prerequisites
