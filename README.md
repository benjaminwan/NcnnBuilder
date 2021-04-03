# NcnnBuilder

Make ncnn Libs for macOS x86_64.

利用Github Actions编译ncnn Libs，用于macOS平台的cmake编译。

ncnn官方包的格式用于Xcode编译。

### 手动编译说明

如果您的系统太新或太旧无法直接使用本仓库编译的包，请尝试手动编译。

#### macOS编译说明

1. 编译环境:

| 操作系统 | 基本软件包 |
| ------- | ------- |
| macos10.15 | [基本软件包](https://github.com/actions/virtual-environments/blob/macOS-10.15/20210327.1/images/macos/macos-10.15-Readme.md) |

Xcode Command Line Tools >= 12

下载安装HomeBrew

```brew install cmake libomp```

2. 同步[ncnn源代码](https://github.com/Tencent/ncnn) 到ncnn文件夹

3. 复制[编译脚本cpu](build-ncnn-mac-cpu.sh)和[编译脚本gpu](build-ncnn-mac-gpu.sh) 到ncnn文件夹

执行```chmod a+x build-ncnn-mac-cpu.sh &&./build-ncnn-mac-cpu.sh```

执行```chmod a+x build-ncnn-mac-gpu.sh &&./build-ncnn-mac-gpu.sh```

编译结果在：ncnn/build-mac-Release-CPU/install，以及ncnn/build-mac-Release-GPU/install