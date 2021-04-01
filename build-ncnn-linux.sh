#!/usr/bin/env bash

mkdir -p "build-linux-Release"
pushd "build-linux-Release"
cmake -DCMAKE_BUILD_TYPE=Release \
    -DNCNN_OPENMP=ON \
    -DNCNN_BUILD_BENCHMARK=OFF \
    -DNCNN_BUILD_EXAMPLES=OFF \
    -DNCNN_BUILD_TOOLS=OFF \
    -DNCNN_PYTHON=OFF \
    -DNCNN_VULKAN=OFF \
..
make -j 2
make install