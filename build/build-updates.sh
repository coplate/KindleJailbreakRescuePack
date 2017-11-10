#!/bin/bash -e
#
# $Id: build-updates.sh 12790 2016-01-16 01:37:16Z NiLuJe $
#

HACKNAME="rp"
PKGNAME="${HACKNAME}"
PKGVER="20131220.N"

# We need kindletool (https://github.com/NiLuJe/KindleTool) in $PATH
if (( $(kindletool version | wc -l) == 1 )) ; then
	HAS_KINDLETOOL="true"
fi

if [[ "${HAS_KINDLETOOL}" != "true" ]] ; then
	echo "You need KindleTool (https://github.com/NiLuJe/KindleTool) to build this package."
	exit 1
fi


# Install
kindletool create ota2 -d kindle5 -C ../src Update_${PKGNAME}_${PKGVER}_install.bin


## Move our updates
mv -f *.bin ../
