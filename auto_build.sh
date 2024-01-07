#!/bin/sh

mkdir build

cd build

cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$install_path

make -j4

