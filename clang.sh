#!/bin/bash
kernel_dir=$PWD
export V="v1.5"
export CONFIG_FILE="ven_defconfig"
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=Exo
export KBUILD_BUILD_HOST=LineageOS
export CCACHE_DIR="/root/.ccache"
export CXX="ccache g++"
export CC="ccache gcc"
export CCACHE_DIR="~/.ccache"
export "PATH=/usr/lib/ccache:$PATH"
export CROSS_COMPILE_ARM32="/d/Project/compiler/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-"
export STRIP_KO="/d/Project/compiler/aarch64-linux-android/aarch64-unknown-linux-android/bin/strip"
export TOOL_CHAIN_PATH="/home/jarvis/kernel/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"
export CLANG_TCHAIN="/home/jarvis/kernel/dragontc/bin/clang"
export CLANG_VERSION="$(${CLANG_TCHAIN} --version | head -n 1 | cut -d'(' -f1,4)"
#export LD_LIBRARY_PATH="${TOOL_CHAIN_PATH}/../lib"
#export PATH=$PATH:${TOOL_CHAIN_PATH}
#export builddir="${kernel_dir}/mateng"
#export modules_dir="zip/system/lib/modules"
#export ZIPPER_DIR="${kernel_dir}/zip"
#export ZIP_NAME="wayang™${V}_Oreo-Los_Aosp.zip"
#export IMAGE="arch/arm64/boot/Image.gz-dtb";
JOBS="-j4"
cd $kernel_dir


make_a_fucking_defconfig() {
	make O=out ven_defconfig -j4
}

compile() {
	PATH=${BIN_FOLDER}:${PATH} make -j4 \
	O=out -j4\
	CC="${CLANG_TCHAIN}" \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=${TOOL_CHAIN_PATH} \
    KBUILD_COMPILER_STRING="${CLANG_VERSION}" \
	HOSTCC="${CLANG_TCHAIN}" \
    $JOBS
}
make_a_fucking_defconfig
compile







