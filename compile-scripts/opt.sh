#!/bin/bash
OPT=~/code/SGXC/build/bin/opt
LF_FILE=support/support.lf

if [[ $# > 1 ]]; then
    FILES=$2
else
    #rm -rf *.reg.ll $LF_FILE
    FILES=*.ll
fi

cd $1

for filename in $FILES; do
    CONVERTED=`echo "$filename" | sed 's/\.ll//'`
    echo $CONVERTED
    echo "$OPT -mem2reg --instnamer -lf-filename=$CONVERTED.lf --annotations-inference $filename -o $CONVERTED.reg.ll" | bash -
    RESULT=$?
    if ! [ $RESULT -eq 0 ]
    then
        rm -f $CONVERTED.lf
        echo "opt failed on file $filename. Error code $RESULT"
    #    exit 1
    fi

    if [ -e $CONVERTED.lf ]; then
        cat $CONVERTED.lf >> $LF_FILE
        rm $CONVERTED.lf
    fi
done
