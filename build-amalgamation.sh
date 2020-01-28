#!/bin/bash

#
#  SQLCipher
#
#  Copyright (c) 2020 Wellington Marthas
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.
#

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
