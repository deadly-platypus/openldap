#!/bin/sh

CLANG=clang
CLANG_FLAGS="-m64 -g -nostdlib -shared"
OBJ_DIR=$1
SUPPORT_DIR=$OBJ_DIR/support
BUILD_DIR=$OBJ_DIR/build

mkdir -p $BUILD_DIR

$CLANG $CLANG_FLAGS $SUPPORT_DIR/sgx_start.o $SUPPORT_DIR/dll_startup.o \
    $SUPPORT_DIR/checks.o $SUPPORT_DIR/l_stubs.o $OBJ_DIR/*.o \
    $SUPPORT_DIR/sgx_end.o -o $BUILD_DIR/openldap-U.dll

python $SUPPORT_DIR/dll_patch.py $BUILD_DIR/openldap-U.dll sgxg_pri 0x3000000000
python $SUPPORT_DIR/dll_patch.py $BUILD_DIR/openldap-U.dll sgxg_pub 0x3110000000
