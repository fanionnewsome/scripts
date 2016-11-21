#!/bin/sh

# This script installs the Self-Driving Database Management System
# http://pelotondb.org
# 
# Set up environment
sudo apt-get --ignore-missing -y install \
    git \
    g++ \
    cmake \
    libgflags-dev \
    libprotobuf-dev \
    protobuf-compiler \
    bison \
    flex \
    libevent-dev \
    libboost-dev \
    libboost-thread-dev \
    libboost-filesystem-dev \
    libjemalloc-dev \
    valgrind \
    lcov \
    postgresql-client

# enter the build directory and run cmake
git clone https://github.com/cmu-db/peloton.git peloton
chdir peloton
mkdir -p build
chdir build
cmake -DCMAKE_BUILD_TYPE=Release ..
sudo make -j4
sudo make install

