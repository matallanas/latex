#!/bin/bash

DOC=thesis
SRC=src
BUILD=build

if [ ! -d $BUILD ]; then
  mkdir $BUILD
fi

make clean
make

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  acroread $DOC.pdf
elif [[ "$unamestr" == 'Darwin' ]]; then
  open /Applications/Preview.app $DOC.pdf
fi
