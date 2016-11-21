#!/bin/sh

# make sure git and cmake are installed
#
sudo apt-get install -y git cmake

# check if the googletest files are present
# and if not, download them from Github
# 
if [ ! -d "./gtest/googletest" ]
then
    git clone https://github.com/google/googletest.git gtest   
fi

# Proceed to perform the installation
#
chdir gtest/googletest
cmake -DBUILD_SHARED_LIBS=ON .
make
sudo cp -a libgtest_main.so libgtest.so /usr/lib
sudo cp -a include/gtest/ /usr/include

echo 'Finished installation of GoogleTest'
echo 'Compile your program using g++ -lgtest -std=c++11 <filename>.cpp'

