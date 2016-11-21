#!/bin/sh

sudo apt-get install -y git cmake

if [ ! -d "./googletest" ]
then
    git clone https://github.com/google/googletest.git gtest   
fi

chdir gtest/googletest
cmake -DBUILD_SHARED_LIBS=ON .
make
sudo cp -a libgtest_main.so libgtest.so /usr/lib
sudo cp -a include/gtest/ /usr/include
echo 'Finished installation of GoogleTest'
echo 'Compile your program using g++ -lgtest -std=c++11 <filename>.cpp'

