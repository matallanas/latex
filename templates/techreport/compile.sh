#!/bin/bash

DOC=techrep
SRC=src
BUILD=build

if [ ! -d $BUILD ]; then
  mkdir $BUILD
fi

make clean
make

mv $SRC/$DOC.pdf ./
#mv $SRC/$DOC.pdf /home/matallanas/Dropbox/

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  acroread $DOC.pdf
elif [[ "$unamestr" == 'Darwin' ]]; then
  open /Applications/Preview.app $DOC.pdf
fi
