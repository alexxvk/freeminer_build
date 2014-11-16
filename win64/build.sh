#!/bin/bash
###############################################################################
# Minetest
# Copyright (C) 2010-2014 celeron55, Perttu Ahola <celeron55@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

set -e

parallel=`grep -c ^processor /proc/cpuinfo`
host=`head -1 /etc/issue`

export dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export TOP=$dir/../..
export OUT=$TOP/out/win64/
[[ ! -d $OUT ]] && mkdir -p $OUT

if [[ "Fedora release 20 (Heisenbug)" == "$host" ]]
then
	toolchain_file=$dir/fedora20/toolchain_mingw64.cmake
elif [[ "Fedora release 21 (Twenty One)" == "$host" ]]
then
	toolchain_file=$dir/fedora21/toolchain_mingw64.cmake
else
	echo "Don't know how to build windows 64 build in $host"
	exit
fi

# Build the thing
cd $TOP/minetest
git_hash=`git show | head -c14 | tail -c7`
cd $OUT
[ ! -d _build ] && mkdir _build
cd _build
cmake $TOP/build \
	-DCMAKE_TOOLCHAIN_FILE=$toolchain_file \
	-DCMAKE_INSTALL_PREFIX=/tmp \
	-DVERSION_EXTRA=$git_hash \
	-DBUILD_CLIENT=1 -DBUILD_SERVER=0 \
	\
	-DENABLE_SOUND=1 \
	-DENABLE_CURL=1 \
	-DENABLE_GETTEXT=1 \
	-DENABLE_FREETYPE=1 \
	-DENABLE_LEVELDB=1 \
	\
	-DCUSTOM_GETTEXT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
	-DGETTEXT_MSGFMT=`which msgfmt` \
	-DGETTEXT_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libintl-8.dll \
	-DGETTEXT_ICONV_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/iconv.dll \
	-DGETTEXT_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include \
	-DGETTEXT_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libintl.dll.a

make package -j$parallel

# EOF
