#!/bin/sh

CLANG=clang
CLANG_FLAGS="-m64 --shared"
CLANG_LIBS="-lws2_32 -lRpcrt4 -lregex"

INPUTS=$1
OUTPUT=$2

$CLANG $CLANG_FLAGS $INPUT $CLANG_LIBS -o $OUTPUT
