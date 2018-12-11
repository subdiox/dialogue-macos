#!/bin/bash

if [ ! `which brew` ]; then
  echo "[Error] Homebrew is not installed. You can install from https://brew.sh/index_ja"
  exit
fi

if [ ! `which greadlink` ]; then
  echo "[Notice] greadlink is not installed. Starting installation..."
  brew install coreutils
fi

if [ ! `which HCopy` ]; then
  echo "[Notice] HTK is not installed, starting installation..."
  if [ ! -e '/usr/X11' ]; then
    echo "[Error] X11(XQuartz) is not installed. You can download from https://www.xquartz.org"
    exit
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
  make all LDFLAGS="-L/usr/X11/lib" CPPFLAGS="-I/usr/X11/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/malloc"
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

if [ ! `which adinrec` ]; then
  echo "[Notice] Julius is not installed. Starting installation..."
  brew install julius julius-dictation-kit
fi
