#!/bin/bash

cd /src/source
cp -f /workspace/script/Makefile /workspace/script/*.cpp .

if [ "$1" = "sse42" ]; then
  SIMDS=("sse42")
elif [ "$1" = "nosimd" ]; then
  SIMDS=("nosimd")
else
  SIMDS=("sse42" "nosimd")
fi

for SIMD in "${SIMDS[@]}"; do
  make clean
  rm -f yaneuraou.*
  if [ "${SIMD}" = "sse42" ]; then
    EXTRA_CPPFLAGS="-DUSE_WASM_SIMD -msimd128 -DUSE_SSE42 -msse4.2"
  else
    EXTRA_CPPFLAGS=""
  fi
  make tournament EM_EXPORT_NAME=YaneuraOu_${SIMD} EXTRA_CPPFLAGS="${EXTRA_CPPFLAGS}"
  mkdir -p /workspace/dist/${SIMD}
  cp -f yaneuraou.* /workspace/dist/${SIMD}
done
