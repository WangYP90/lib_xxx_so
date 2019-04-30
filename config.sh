# NDK路径
export NDK_ROOT=$NDKROOT

export AOSP_TOOLCHAIN_SUFFIX=4.9

export ANDROID_VERSION="android-21"

ARCH="arch-arm"
CPU=armv7-a
HOST=arm
TOOLCHAIN_BASE="arm-linux-androideabi"




#架构,如果参与小于1也就是等于0, 默认编译armv7,或者获取参数转大写为小写,赋值给HTE_ARCH
if [ "$#" -lt 1 ]
then
	THE_ARCH=armv7
else
	THE_ARCH=$(tr "[A-Z]" "[a-z]" <<< "$1")
fi

# 根据不同架构配置环境变量
case "$THE_ARCH" in
  arm|armv5|armeabi)
	TOOLCHAIN_BASE="arm-linux-androideabi"
	TOOLNAME_BASE="arm-linux-androideabi"
	ANDROID_VERSION="android-19"
	ARCH="arch-arm"
	CPU=armv7-a
	HOST="arm-linux"
	OPTIMIZE_CFLAGS="-march=armv5te -mtune=xscale -mthumb -msoft-float -funwind-tables -fexceptions -frtti"
	OPTIMIZE_FF_EXTRA_CFLAGS="-O3 -fpic -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300 -mfloat-abi=softfp -mfpu=vfp -marm -march=armv6"
	OPTIMZE_FF_CFLAGS="-O3 -Wall -pipe -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID "
	;;
  armv7|armv7a|armeabi-v7a)
	TOOLCHAIN_BASE="arm-linux-androideabi"
	TOOLNAME_BASE="arm-linux-androideabi"
	ANDROID_VERSION="android-19"
    ARCH="arch-arm"
    CPU=armv7-a
    HOST="arm-linux"
    OPTIMIZE_CFLAGS="-march=armv7-a -mthumb -mfpu=vfpv3-d16 -mfloat-abi=softfp -Wl,--fix-cortex-a8 -funwind-tables -fexceptions -frtti"
    OPTIMIZE_FF_EXTRA_CFLAGS="-DANDROID -fPIC -ffunction-sections -funwind-tables -fstack-protector -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 -fomit-frame-pointer -fstrict-aliasing -funswitch-loops -finline-limit=300 "
    OPTIMZE_FF_CFLAGS="-O3 -Wall -pipe -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID  "
	;;
  armv8|armv8a|aarch64|arm64|arm64-v8a)
    TOOLCHAIN_BASE="aarch64-linux-android"
	TOOLNAME_BASE="aarch64-linux-android"
	ANDROID_VERSION="android-21"
    ARCH="arch-arm64"
    CPU=arm64-v8a
    HOST="aarch64-linux"
    OPTIMIZE_CFLAGS="-funwind-tables -fexceptions -frtti"
    OPTIMIZE_FF_EXTRA_CFLAGS=""
    OPTIMZE_FF_CFLAGS="-O3 -Wall -pipe -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID  "
	;;
  x86)
    TOOLCHAIN_BASE="x86"
	TOOLNAME_BASE="i686-linux-android"
	ANDROID_VERSION="android-19"
    ARCH="arch-x86"
    CPU=x86
    HOST="i686-linux"
    OPTIMIZE_CFLAGS="-march=i686 -mtune=intel -mssse3 -mfpmath=sse -funwind-tables -fexceptions -frtti"
    OPTIMIZE_FF_EXTRA_CFLAGS="-O3 -DANDROID -Dipv6mr_interface=ipv6mr_ifindex -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -fomit-frame-pointer -march=k8 "
    OPTIMZE_FF_CFLAGS="-O3 -Wall -pipe -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID  "
	;;
  x86_64|x64)
    TOOLCHAIN_BASE="x86_64"
	TOOLNAME_BASE="x86_64-linux-android"
	ANDROID_VERSION="android-21"
    ARCH="arch-x86_64"
    CPU=x86_64
    HOST="x86_64-linux"
    OPTIMIZE_CFLAGS="-march=x86-64 -msse4.2 -mpopcnt -mtune=intel -funwind-tables -fexceptions -frtti"
	OPTIMIZE_FF_EXTRA_CFLAGS="-O3 -DANDROID -Dipv6mr_interface=ipv6mr_ifindex -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -fomit-frame-pointer -march=k8 "
	OPTIMZE_FF_CFLAGS="-O3 -Wall -pipe -ffast-math -fstrict-aliasing -Werror=strict-aliasing -Wno-psabi -Wa,--noexecstack -DANDROID  "
	;;
  mips|mipsel)
    TOOLCHAIN_BASE="mipsel-linux-android"
	TOOLNAME_BASE="mipsel-linux-android"
	ANDROID_VERSION="android-19"
    ARCH="arch_mips"
    CPU=mips
    HOST="mipsel-linux"
	OPTIMIZE_CFLAGS="-funwind-tables -fexceptions -frtti"
	OPTIMIZE_FF_EXTRA_CFLAGS=""
	OPTIMZE_FF_CFLAGS=""
	;;
  mips64|mipsel64|mips64el)
    TOOLCHAIN_BASE="mips64el-linux-android"
	TOOLNAME_BASE="mips64el-linux-android"
	ANDROID_VERSION="android-21"
    ARCH="arch_mips64"
    CPU=mips64
    HOST="mipsel64-linux"
    OPTIMIZE_CFLAGS="-funwind-tables -fexceptions -frtti"
    OPTIMIZE_FF_EXTRA_CFLAGS=""
    OPTIMZE_FF_CFLAGS=""
	;;
  *)
	echo "ERROR:Unkonown architecture $1"
	[ "$0" = "$BASH_SOURCE" ] && exit 1 || return 1
	;;
esac


echo "TOOLCHAIN_BASE="$TOOLCHAIN_BASE
echo "ARCH="$ARCH
echo "CPU="$CPU
echo "HOST="=$HOST
echo "OPTIMIZE_CFLAGS"=$OPTIMIZE_CFLAGS



