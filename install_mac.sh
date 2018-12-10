#!/bin/bash

if [ -x which brew ]; then
  echo "[Error] Homebrew is not installed.\nYou can install from https://brew.sh/index_ja"
  exit
fi

if [ -x which greadlink ]; then
  echo "[Notice] greadlink is not installed, starting installation..."
  brew install coreutils;
fi

if [ -x which HCopy ]; then
  echo "[Notice] HTK is not installed, starting installation..."
  if [ ! -e '/usr/X11' ] && [ ! -e '/usr/X11R6' ]; then
    echo "[Error] X11(XQuartz) is not installed.\nYou can download from https://www.xquartz.org"
    exit
  fi
  if [ ! -e '/usr/X11R6' ]; then
    echo "[Notice] You need to create symbolic link of X11. You may need to input your password."
    sudo ln -s /usr/X11 /usr/X11R6
  fi
  if [ ! -e 'HTK-3.4.1.tar.gz' ]; then
    curl -u subdiox:o7Avmvdj http://htk.eng.cam.ac.uk/ftp/software/HTK-3.4.1.tar.gz -o HTK-3.4.1.tar.gz
    if [ -e 'htk' ]; then
      rm -rf htk
    fi
    tar -xf HTK-3.4.1.tar.gz
    cd htk
    ./configure
    make all
    make install
  fi
fi


