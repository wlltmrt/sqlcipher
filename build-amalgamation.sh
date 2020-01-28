#!/bin/bash

TMP_DIR=$(mktemp -d)
SRC_DIR=$(pwd)/Sources

cd $TMP_DIR

git clone https://github.com/sqlcipher/sqlcipher

cd sqlcipher

./configure --with-crypto-lib=none
make -C . sqlite3.c

if [ -d $SRC_DIR ]; then
    rm -rf $SRC_DIR
fi

mkdir $SRC_DIR
mkdir $SRC_DIR/include

cp sqlite3.c $SRC_DIR
cp sqlite3.h $SRC_DIR/include

rm -rf $TMP_DIR
