:: build ncnn for windows by benjaminwan
@ECHO OFF
chcp 65001
cls
SETLOCAL EnableDelayedExpansion

for /f "Delims=" %%x in (ncnn_cmake_options.txt) do set OPTIONS=!OPTIONS!%%x

call :cmakeParams "Visual Studio 16 2019" "v142" "x64" "md"
call :cmakeParams "Visual Studio 16 2019" "v142" "Win32" "md"
call :cmakeParams "Visual Studio 16 2019" "v142" "x64" "mt"
call :cmakeParams "Visual Studio 16 2019" "v142" "Win32" "mt"

GOTO:EOF

:cmakeParams
mkdir "build-%~2-%~3-%~4-cpu"
pushd "build-%~2-%~3-%~4-cpu"
if "%~4" == "mt" (
    set STATIC_CRT_ENABLED=ON
)^
else (
    set STATIC_CRT_ENABLED=OFF
)

cmake -G "%~1" -T "%~2,host=x64" -A "%~3" -DCMAKE_INSTALL_PREFIX=install ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DNCNN_VULKAN=OFF ^
  -DNCNN_BUILD_WITH_STATIC_CRT=%STATIC_CRT_ENABLED% ^
  %OPTIONS% ^
  ..
cmake --build . --config Release -j %NUMBER_OF_PROCESSORS%
cmake --build . --config Release --target install
popd
GOTO:EOF