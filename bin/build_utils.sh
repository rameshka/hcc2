#!/bin/bash
#
#  File: build_utils.sh
#        Build the HCC2 utilities
#        The install option will install components into the hcc2 installation. 
#
# MIT License
#
# Copyright (c) 2017 Advanced Micro Devices, Inc. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#  This script can be controlled with these environment variables
HCC2=${HCC2:-/opt/rocm/hcc2}
HCC2_REPOS=${HCC2_REPOS:-/home/$USER/git/hcc2}
HCC2_REPO_NAME=${HCC2_REPO_NAME:-hcc2}
INSTALL_UTILS=${INSTALL_UTILS:-$HCC2}
BUILD_HCC2=${BUILD_HCC2:-$HCC2_REPOS}
SUDO=${SUDO:-set}

if [ $SUDO == "set" ] ; then
   SUDO="sudo"
else
   SUDO=""
fi

UTILS_DIR=${HCC2_REPOS}/$HCC2_REPO_NAME/utils
INSTALL_DIR=${INSTALL_UTILS}
BUILD_DIR=$BUILD_HCC2
MYCMAKEOPTS="-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR "

if [ "$1" == "-h" ] || [ "$1" == "help" ] || [ "$1" == "-help" ] ; then
  echo " "
  echo "Example commands and actions: "
  echo "  ./build_utils.sh                   cmake, make, NO Install "
  echo "  ./build_utils.sh nocmake           NO Cmake, make, NO install "
  echo "  ./build_utils.sh install           NO Cmake, make install "
  echo " "
  exit
fi

if [ ! -d $UTILS_DIR ] ; then
   echo "ERROR:  The directory $UTILS_DIR was not found"
   exit 1
fi

if [ ! -f $HCC2/bin/clang ] ; then
   echo "ERROR:  Missing file $HCC2/bin/clang"
   echo "        Build the HCC2 llvm compiler in $HCC2 first"
   echo "        This is needed to build the utilities"
   echo " "
   exit 1
fi

# Make sure we can update the install directory
if [ "$1" == "install" ] ; then
   $SUDO mkdir -p $INSTALL_DIR
   $SUDO touch $INSTALL_DIR/testfile
   if [ $? != 0 ] ; then
      echo "ERROR: No update access to $INSTALL_DIR"
      exit 1
   fi
   $SUDO rm $INSTALL_DIR/testfile
fi

if [ "$1" != "nocmake" ] && [ "$1" != "install" ] ; then

  if [ -d "$BUILD_DIR/build/utils" ] ; then
     echo
     echo " FRESH START , CLEANING UP FROM PREVIOUS BUILD"
     echo " rm -rf $BUILD_DIR/build/utils"
     rm -rf $BUILD_DIR/build/utils
  fi

  mkdir -p $BUILD_DIR/build/utils
  cd $BUILD_DIR/build/utils
  echo 
  echo " ---- Running cmake at $BUILD_DIR/build/utils ---- "
  echo cmake $MYCMAKEOPTS $UTILS_DIR
  cmake $MYCMAKEOPTS $UTILS_DIR
  if [ $? != 0 ] ; then
      echo "ERROR utils cmake failed. Cmake flags"
      echo "      $MYCMAKEOPTS"
      exit 1
  fi
fi

echo
echo " ---- Running make at $BUILD_DIR/build/utils ---- "
cd $BUILD_DIR/build/utils
make
if [ $? != 0 ] ; then
      echo
      echo "ERROR: make FAILED"
      echo
      exit 1
else
  if [ "$1" != "install" ] ; then
      echo
      echo " BUILD COMPLETE! To install in $INSTALL_DIR/bin run this command:"
      echo "  $0 install"
      echo
  fi
fi

if [ "$1" == "install" ] ; then
      echo
      echo " ---- Installing to $INSTALL_DIR/bin ----- "
      cd $BUILD_DIR/build/utils
      $SUDO make install
      if [ $? != 0 ] ; then
         echo "ERROR make install failed "
         exit 1
      fi
      echo
      echo " INSTALL COMPLETE!"
      echo
fi
