#!/bin/sh
set -e
cd ../third_party/lua
emmake make clean
exec emmake make -j4 MYCFLAGS="-DLUA_32BITS -std=c99" MYLIBS="-ldl" MYLDFLAGS="" CC="emcc" AR="emar rc" RANLIB="emranlib"
