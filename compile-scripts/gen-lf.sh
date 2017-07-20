#!/bin/sh

CLANG=clang
CLANG_FLAGS="-m64 -nostdlib -shared"
OBJ_DIR=$1
SUPPORT_DIR=$OBJ_DIR/support
BUILD_DIR=$OBJ_DIR/build

mkdir -p $BUILD_DIR

$CLANG $CLANG_FLAGS $SUPPORT_DIR/sgx_start.o $SUPPORT_DIR/dll_startup.o \
    $SUPPORT_DIR/checks.o $OBJ_DIR/*.o \
    $SUPPORT_DIR/sgx_end.o 2>&1 > /dev/null | awk '{if(!a[$5]++) print $5;}' | grep "'" | sed "s/[\`']//g" > ir/support/lf.intermediate

grep -w -f ir/support/lf.intermediate ir/support/support.lf | awk '{if(!a[$2]++) print $0;}' > ir/support/pruned.lf
