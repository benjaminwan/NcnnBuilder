#!/usr/bin/env bash

mkdir build-mac-Release-GPU && cd build-mac-Release-GPU
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
cmake --build . -j 2
cmake --build . --target install