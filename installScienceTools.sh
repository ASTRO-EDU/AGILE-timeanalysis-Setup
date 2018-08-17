#!/usr/bin/env bash

trap exit ERR

if [ "$1" == "-j" ] ; then
    parallel=$1
fi

### check environment variables
if [ -z "$AGILE" ] || [ -z $(env | grep "AGILE=") ] ; then
    echo "AGILE environment variable not set. Abort."
    exit
fi
if [ -z "$CFITSIO" ] || [ -z $(env | grep "CFITSIO=") ] ; then
    echo "CFITSIO environment variable not set. Abort."
    exit
fi
if [ -z "$ROOTSYS" ] || [ -z $(env | grep "ROOTSYS=") ] ; then
    echo "ROOTSYS environment variable not set. Abort."
    exit
fi

if [ "$1" == "clean" ] ; then
    cd libtimeanalysis
    make clean
    cd ../agiletimeanalysis2/app-select-timelist
    make clean
    exit
fi

echo "install libtimeanalysis"
cd libtimeanalysis
make ${parallel} install prefix=$AGILE
cd ..

echo "install agiletimeanalysis2/app-select-timelist"
cd agiletimeanalysis2/app-select-timelist
make ${parallel} install prefix=$AGILE
cd ..

#if [ -z "$OPENCV" ] || [ -z $(env | grep "OPENCV=") ] ; then
#    	echo "OPENCV environment variable not set. AG_extspot not installed."
#else
#	echo "install AG_extspot"
#	cd agextspot-v2
#	make ${parallel} install prefix=$AGILE
#	cd ..
#fi


