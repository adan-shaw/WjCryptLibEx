#!/bin/sh

# 检查动/静态链接库的输出API

objdump -T ./build/libWjCryptLib.so.so

objdump -t ./build/libWjCryptLib.a
