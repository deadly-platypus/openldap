#!/bin/bash
LLC=~/code/SGXC/build/bin/llc
CLANG=~/code/SGXC/build/bin/clang

LLC_CMD="$LLC --generate-sgx-code --code-model=large --sgx-stack-size=0x10000000"
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
