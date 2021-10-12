#!/usr/bin/env bash

function cmakeParamsMac() {
  mkdir -p "build-$1-GPU"
  pushd "build-$1-GPU"
  cmake -DCMAKE_BUILD_TYPE=$1 \
    $(cat ../ncnn_cmake_options.txt) \
    -DNCNN_VULKAN=ON \
    ..
  cmake --build . --config $1 -j $NUM_THREADS
  cmake --build . --config $1 --target install
  popd
}

function cmakeParamsLinux() {
  mkdir -p "build-$1-GPU"
  pushd "build-$1-GPU"
  cmake -DCMAKE_BUILD_TYPE=$1 \
    $(cat ../ncnn_cmake_options.txt) \
    -DNCNN_VULKAN=ON \
    ..
  cmake --build . --config $1 -j $NUM_THREADS
  cmake --build . --config $1 --target install
  popd
}

sysOS=$(uname -s)
NUM_THREADS=1

if [ $sysOS == "Darwin" ]; then
  #echo "I'm MacOS"
  NUM_THREADS=$(sysctl -n hw.ncpu)
  cmakeParamsMac "Release"
elif [ $sysOS == "Linux" ]; then
  #echo "I'm Linux"
  NUM_THREADS=$(grep ^processor /proc/cpuinfo | wc -l)
  cmakeParamsLinux "Release"
else
  echo "Other OS: $sysOS"
fi
