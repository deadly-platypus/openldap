#!/bin/sh
CLANG_BIN_DIR=/home/t-demcke/code/SGXC/build/bin
CLANG_BIN_DIR_REGEX=$(echo "$CLANG_BIN_DIR" | sed 's,/,\\/,g' | sed 's/\-/\\\-/g')
MINGW_TOP_DIR=/c/msys64/mingw64

#INCLUDES="-I$MINGW_TOP_DIR/lib/clang/4\.0\.0/include "
#INCLUDES+="-I/opt/x86_64-w64-mingw32/include "
#INCLUDES+="-I$MINGW_TOP_DIR/x86_64-w64-mingw32/include "
#INCLUDES+="-I$MINGW_TOP_DIR/include "

INCLUDES_REGEX=$(echo "$INCLUDES" | sed 's,/,\\/,g' | sed 's/\-/\\\-/g')

echo "regex clang: $CLANG_BIN_DIR_REGEX"
echo "includes regex: $INCLUDES_REGEX"

# Configure with vanilla clang so it succeeds
CC=clang CXX=clang++ CFLAGS="-m64" ./configure --without-tls

# Emit dependencies
#make depend
#if ! [ $? -eq 0 ]; then
#    echo "Make depend failed with code $?"
#    exit
#fi

# Keep object files around
#echo "Making MV to be a no-op"
#grep -rl "mv \-f" --include=Makefile --exclude-dir=doc/ --exclude-dir=tests/ . \
#    | xargs sed -i -e "s/mv \-f/cp/"
#echo "Done."

# Don't delete the object files that were just created
#echo "Making RM to be a no-op"
#grep -rl "rm \-f" --include=Makefile --exclude-dir=doc/ --exclude-dir=tests/ . \
#    | xargs sed -i -e "s/rm \-f/echo/"
#echo "Done."

# Generate all needed object files before emitting IR
#make

# Replace generated flags with IR generating flags
#echo "Replacing flags..."
#grep -rl "\-m64" --include=Makefile --exclude-dir=libraries/ --exclude-dir=doc/ --exclude-dir=tests/ . | \
#    xargs sed -i -e "s/\-m64/\-m64 \-S \-emit\-llvm/"
#grep -rl "\-O[0-9]" --include=Makefile --exclude-dir=doc/ --exclude-dir=tests/ . \
#   | xargs sed -i -e "s/\-O[0-9]/\-O0/"
#echo "Done."

# Replace vanilla clang with our clang
#echo "Replacing clang..."
#grep -rl "= clang" --include=Makefile --exclude-dir=doc/ --exclude-dir=tests/ . \
#    |  xargs sed -i -e "s/= clang/= $CLANG_BIN_DIR_REGEX\/clang\.exe \-S \-emit\-llvm/"
#echo "Done."

#echo "Starting IR Generation..."
#make
#echo "Done."
