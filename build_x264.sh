#!/bin/bash

THE_ARCH=$1

source config.sh $THE_ARCH
PREFIX=$(pwd)/android/$CPU
echo "PREFIX="$PREFIX

TOOLCHAIN=$NDK_ROOT/toolchains/$TOOLCHAIN_BASE-$AOSP_TOOLCHAIN_SUFFIX/prebuilt/linux-x86_64
CROSS_COMPTLE=$TOOLCHAIN/bin/$TOOLNAME_BASE-
SYSROOT=$NDK_ROOT/platforms/$ANDROID_VERSION/$ARCH

./configure \
--prefix=$PREFIX \
--enable-shared \
--enable-static \
--enable-pic \
--disable-asm \
--disable-cli \
--disable-thread \
--host=$HOST \
--cross-prefix=$CROSS_COMPTLE \
--sysroot=$SYSROOT

make clean
make
make install
