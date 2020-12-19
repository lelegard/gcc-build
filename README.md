## Build scripts for GCC

This repository contains personal scripts to rebuild older versions of GCC
on recent platforms where these older versions are no longer available.
Each version of GCC is installed in `/opt/gcc-X.Y.Z`.

The typical "target" is CentOS 8 which is the most recent version of CentOS,
with CentOS being the distro with the oldest software components. Thus, this
is the best up-to-date target for rebuilding old versions of GCC. Other distros
with more recent software components may bring more incompatibility issues.

All scripts accept two parameters: a mandatory GCC version (e.g. "4.8.5" or "6.3.0")
and an optional target (the default is "centos8"). The target is just a name which
is used to differentiate patches for a given version of GCC on distinct distros.
If we only use CentOS, the default is good enough.

Typical scenario:

- Run `get-gcc.sh` to download and expand the source code of a given version of GCC.
  If a patch already exists for this GCC version on this target, it is applied.

- Run `build-gcc.sh` to build and install the specified version of GCC.

- If no patch already exists for this GCC version on this target, compilation
  issues may appear. Fix them and relaunch `make -j10 -C BUILD` until the build
  is successful.

- If compilation issues were fixed, create the patch for this GCC version on
  this target. First, expand the GCC tarball again to get a reference tree and
  run `build-patch.sh`. The patch is created from the differences between the
  reference tree and the modified one. Commit the changes to integrate the new
  patch.

- To test the new GCC on the TSDuck project, run `build-tsduck.sh`.
