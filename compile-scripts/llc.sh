#!/bin/bash
LLC=~/code/SGXC/build/bin/llc
CLANG=~/code/SGXC/build/bin/clang

LLC_FLAGS="--generate-sgx-code --code-model=large --sgx-stack-size=0x10000000 -generate-checks -generate-indirect-call-checks -generate-return-checks"
IF_ELSE_CHECKS="-non-mpx-checks -non-mpx-checks-reg -private-segment-start=0x7F0000000 -segment-size=0x20000000"
#IF_ELSE_CHECKS=

LLC_CMD="$LLC $LLC_FLAGS $IF_ELSE_CHECKS"
CLANG_CMD="$CLANG -m64 -g"
DEFINED="support/defined.funcs"

MAIN_FILE="$2"

echo $MAIN_FILE
cd $1

if [[ $# > 2 ]]; then
    FILES=$3
else
    #rm -f $DEFINED
    FILES=*.reg.ll
fi

for filename in $FILES; do
    CONVERTED=`echo $filename | sed 's/\.reg\.ll//'`
    echo $CONVERTED
    echo $LLC_CMD " -o $CONVERTED.s $filename" | bash -
    RESULT=$?
    if ! [ $RESULT -eq 0 ]
    then
        echo "llc failed on file $filename. Error code $RESULT"
        #exit 1
        continue
    fi

    if [[ $MAIN_FILE != $CONVERTED ]]; then
        CONTAINS_MAIN=$(cat $CONVERTED.s | grep "^main:")
        if [[ ! -z $CONTAINS_MAIN ]]; then
            echo "!!! $CONVERTED.s contains main"
            continue
        fi
    fi

    echo $CLANG_CMD " -c $CONVERTED.s" | bash -
    RESULT=$?
    if ! [ $RESULT -eq 0 ]
    then
        echo "clang failed on file $CONVERTED.s Error code $RESULT"
        #exit 1
        continue
    fi

    # Get all the functions defined in this file
    #nm -Ca "$CONVERTED.o" | grep " T " >> "$DEFINED"
done
