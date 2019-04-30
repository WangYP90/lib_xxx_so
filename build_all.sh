#!/bin/bash

function build_all
{
        for arch in armeabi armeabi-v7a arm64-v8a x86 x86_64
        do
                bash $file_path $arch
        done
}

if [ "$#" -lt 1 ]
then
	echo "ERROR:请在执行脚本时,指定需要执行的.sh"
	exit 1|| return 1
else
	file_path=$1
	echo "打印filepath:"$file_path
	if [ $file_path -eq "" ]
	then
		echo "ERROR:请在执行脚本时,指定需要执行的.sh"
		exit 1
	elif [ -f $file_path ]
	then
		build_all
	else
		echo "ERROR:文件不存在"
		exit 1
	fi
fi

