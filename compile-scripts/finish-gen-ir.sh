#!/bin/sh

# Tasks to be done to build U DLL
PWD=`pwd`
CLANG_CMD=$1
CLANG_FLAGS="-g -m64 -S -emit-llvm"

# Generate missing ll files
echo "Generating missing LL files"
cd $PWD/libraries/liblutil
$CLANG_CMD $CLANG_FLAGS -DHAVE_GETOPT -I../../include -c -o getopt.ll getopt.c

cd ../../servers/slapd/
$CLANG_CMD $CLANG_FLAGS -I../../include -I. -I./slapi -I. -I../../include -o get_real_passwd.ll -c get_real_passwd.c
