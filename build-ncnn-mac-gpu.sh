#!/usr/bin/env bash

mkdir -p "build-mac-Release-GPU"
pushd "build-mac-Release-GPU"
export VULKAN_SDK=`pwd`/vulkansdk-macos-1.2.162.0/macOS
cmake -DCMAKE_BUILD_TYPE=Release \
    -DNCNN_OPENMP=ON \
    -DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" \
    -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp -I/usr/local/opt/libomp/include" \
    -DOpenMP_CXX_LIB_NAMES="omp" \
    -DOpenMP_C_LIB_NAMES="omp" \
    -DOpenMP_omp_LIBRARY=/usr/local/opt/libomp/lib/libomp.dylib \
    -DNCNN_BUILD_BENCHMARK=OFF \
    -DNCNN_BUILD_EXAMPLES=OFF \
    -DNCNN_BUILD_TOOLS=OFF \
    -DNCNN_PYTHON=OFF \
    -DNCNN_VULKAN=ON \
..
make -j 2
make install
popd