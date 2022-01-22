#!/bin/sh
set -e
rm -r dist || true
mkdir dist
cp ../third_party/lua/lua dist/lua.js
cp ../third_party/lua/lua.wasm dist/
cp ../third_party/json.lua/json.lua dist/
cp ../src/main.lua dist/
cp index.html piplup.js dist/
