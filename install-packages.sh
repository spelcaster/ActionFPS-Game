#!/bin/bash
TARGET=target
mkdir -p ${TARGET}
AC_FILE="v1.2.0.2.tar.gz"
AC_TARGET="${TARGET}/${AC_FILE}"
AC_URL="https://github.com/assaultcube/AC/archive/${AC_FILE}"
if [ ! -f "$AC_TARGET" ]; then
  which wget && wget --continue -O ${AC_TARGET} $AC_URL || (curl -o ${AC_TARGET} $AC_URL)
fi
AC_TARGET_DIR="${TARGET}/AC-1.2.0.2"
(cd $TARGET && tar zxf ${AC_FILE})
cp -R ${AC_TARGET_DIR}/packages/{models,textures,audio,crosshairs} packages/
cp -R ${AC_TARGET_DIR}/packages/maps/official packages/maps/
