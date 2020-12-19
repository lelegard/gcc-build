# To be source'd by all other scripts.

SCRIPT=$(basename ${BASH_SOURCE[1]})
SCRIPTDIR=$(cd $(dirname ${BASH_SOURCE[1]}); pwd)

error() { echo >&2 "$SCRIPT: $*"; exit 1; }
usage() { echo >&2 "usage: $SCRIPT gccversion [target]"; exit 1; }

[[ $# -lt 1 ]] && usage
GCCVERSION=$1
TARGET=${2:-centos8}

GCCROOT=/opt/gcc-$GCCVERSION
GCCBIN=$GCCROOT/bin
GCCLIB=$GCCROOT/lib64

cd $SCRIPTDIR
