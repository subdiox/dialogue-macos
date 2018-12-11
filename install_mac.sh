#!/bin/bash

if [ ! `which brew` ]; then
  echo "[Error] Homebrew is not installed. You can install from https://brew.sh/index_ja"
  exit
fi

if [ ! `which greadlink` ]; then
  echo "[Notice] greadlink is not installed, starting installation..."
  brew install coreutils;
fi

if [ ! `which HCopy` ]; then
  echo "[Notice] HTK is not installed, starting installation..."
  if [ ! -e '/usr/X11' ] && [ ! -e '/usr/X11R6' ]; then
    echo "[Error] X11(XQuartz) is not installed. You can download from https://www.xquartz.org"
    exit
  fi
  if [ ! -e '/usr/X11R6' ]; then
    echo "[Notice] You need to create symbolic link of X11. You may need to input your password."
    sudo ln -s /usr/X11 /usr/X11R6
  fi
  if [ ! -e 'HTK-3.4.1.tar.gz' ]; then
    curl -u subdiox:o7Avmvdj http://htk.eng.cam.ac.uk/ftp/software/HTK-3.4.1.tar.gz -o HTK-3.4.1.tar.gz
  fi
  if [ -e 'htk' ]; then
    rm -rf htk
  fi
  if [ ! -e '/Library/Developer/CommandLineTools' ]; then
    echo "[Notice] Developer Tools are not installed. Starting installation..."
    sudo xcode-select --install
  fi
  tar -xf HTK-3.4.1.tar.gz
  cd htk
  ./configure
  make all CPPFLAGS="-I/usr/X11R6/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/malloc"
  make install
fi

if [ `python3 -c "import numpy"` ]; then
  echo "[Notice] numpy is not installed on your python3. Starting installation..."
  pip3 install numpy
fi

if [ ! `which svm-scale` ]; then
  echo "[Notice] libsvm is not installed. Starting installation..."
  brew install libsvm
fi
