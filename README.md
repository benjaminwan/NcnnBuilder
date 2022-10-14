# NcnnBuilder

利用Github Actions编译ncnn Libs。

### 手动编译说明

如果您的系统太新或太旧无法直接使用本仓库编译的包，请尝试手动编译。

#### Linux编译说明

1. 编译环境:

| 操作系统 | 基本软件包 |
| ------- | ------- |
| Ubuntu18.04 | [基本软件包](https://github.com/actions/virtual-environments/blob/main/images/linux/Ubuntu1804-README.md) |

安装build-essential和cmake

```shell
sudo apt-get install build-essential cmake
```

2. 同步[ncnn源代码](https://github.com/Tencent/ncnn) 到ncnn文件夹

3. 复制[编译脚本cpu](build-ncnn-cpu.sh)、[编译脚本gpu](build-ncnn-gpu.sh)、[cmake选项](ncnn_cmake_options.txt) 到ncnn文件夹

执行```chmod a+x build-ncnn-cpu.sh &&./build-ncnn-cpu.sh```

执行```chmod a+x build-ncnn-gpu.sh &&./build-ncnn-gpu.sh```

编译结果在：ncnn/build-Release-CPU/install，以及ncnn/build-Release-GPU/install

#### macOS编译说明

1. 编译环境:

| 操作系统 | 基本软件包 |
| ------- | ------- |
| macos10.15 | [基本软件包](https://github.com/actions/virtual-environments/blob/macOS-10.15/20210327.1/images/macos/macos-10.15-Readme.md) |

安装[Xcode](https://developer.apple.com/download/more) > 12

安装[HomeBrew](https://brew.sh/)

安装libomp(20220420开始禁用了openmp)
```brew install cmake libomp```

安装CommandLineTools

```shell
brew doctor
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

2. 同步[ncnn源代码](https://github.com/Tencent/ncnn) 到ncnn文件夹

3. 复制[编译脚本cpu](build-ncnn-cpu.sh)、[编译脚本gpu](build-ncnn-gpu.sh)、[cmake选项](ncnn_cmake_options.txt) 到ncnn文件夹

执行```chmod a+x build-ncnn-cpu.sh &&./build-ncnn-cpu.sh```

执行```chmod a+x build-ncnn-gpu.sh &&./build-ncnn-gpu.sh```

编译结果在：ncnn/build-Release-CPU/install，以及ncnn/build-Release-GPU/install

#### windows编译说明

1. 编译环境:

| 操作系统 | 基本软件包 |
| ------- | ------- |
| Windows-vs2017 | [基本软件包](https://github.com/actions/virtual-environments/blob/win16/20210329.1/images/win/Windows2016-Readme.md) |
| Windows-vs2019 | [基本软件包](https://github.com/actions/virtual-environments/blob/win19/20210316.1/images/win/Windows2019-Readme.md) |

安装vs2017或者vs2019，并选中"C++桌面开发"

安装[cmake](https://cmake.org/download/)

2. 同步[ncnn源代码](https://github.com/Tencent/ncnn) 到ncnn文件夹

3. 复制编译脚本和cmake选项

vs2017环境，复制[编译脚本vs2017](build-ncnn-cpu-vs2017.bat)和[cmake选项](ncnn_cmake_options.txt)到ncnn文件夹

vs2019环境，复制[编译脚本vs2019](build-ncnn-cpu-vs2019.bat)和[cmake选项](ncnn_cmake_options.txt)到ncnn文件夹

4. 开始菜单打开"x64 Native Tools Command Prompt for VS 2019"或"适用于 VS2017 的 x64 本机工具"，
   运行对应的编译脚本，编译结果在：ncnn/build-xxx-xxx/install

### 关于Windows静态链接CRT

编译选项添加NCNN_BUILD_WITH_STATIC_CRT=ON

#### 20221013

- ncnn: 20220729
- vulkan: 1.2.189.0
- windows平台，更早版本的包均为md版，从此版增加链接静态CRT版本(mt)
- 后缀md: NCNN_BUILD_WITH_STATIC_CRT=OFF
- 后缀mt: NCNN_BUILD_WITH_STATIC_CRT=ON