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
libdir=$dir/externals

if [[ "Fedora release 20 (Heisenbug)" == "$host" ]]
then
	toolchain_file=$dir/fedora20/toolchain_mingw64.cmake
	hostdir=$dir/fedora20/
elif [[ "Fedora release 21 (Twenty One)" == "$host" ]]
then
	toolchain_file=$dir/fedora21/toolchain_mingw64.cmake
	hostdir=$dir/fedora20/
else
	echo "Don't know how to build windows 64 build in $host"
	exit
fi
. $hostdir/env.sh

#Build dependancies
#leveldb
cd $OUT
if [ ! -f "_externals/leveldb/bin/libleveldb.dll" ]
then
	mkdir -p _externals/leveldb/bin/
	mkdir -p _externals/leveldb/lib/
	cp -r $TOP/external/leveldb/* _externals/leveldb/
	cd _externals/leveldb/
	TARGET_OS=OS_WINDOWS_CROSSCOMPILE CC=x86_64-w64-mingw32-gcc CXX=x86_64-w64-mingw32-g++ AR=x86_64-w64-mingw32-ar \
        make libleveldb.a libleveldb.dll
	mv libleveldb.a libleveldb.dll.a lib/
	mv libleveldb.dll bin/
fi

#LuaJIT
cd $OUT
if [ ! -f "_externals/luajit/src/lua51.dll" ]
then
	mkdir -p _externals/luajit
	cp -r $TOP/external/LuaJIT/* _externals/luajit/
	cd _externals/luajit
	make CROSS=x86_64-w64-mingw32- TARGET_SYS=Windows
fi

#OpenAL-soft
cd $OUT
if [ ! -f "_externals/openal-soft/OpenAL32.dll" ]
then
	mkdir -p _externals/openal-soft
	cd _externals/openal-soft
	cmake $TOP/external/openal-soft/ \
		-DCMAKE_TOOLCHAIN_FILE=$toolchain_file
	make
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
	-DLUA_INCLUDE_DIR=$OUT/_externals/luajit/src \
	-DLUA_LIBRARY=$OUT/_externals/luajit/src/lua51.dll \
	\
	-DVORBIS_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include \
	-DVORBIS_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libvorbis.dll.a \
	-DVORBIS_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libvorbis-0.dll \
	-DVORBISFILE_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libvorbisfile.dll.a \
	-DVORBISFILE_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libvorbisfile-3.dll \
	\
	-DOPENAL_INCLUDE_DIR=$TOP/external/openal-soft/include/AL \
	-DOPENAL_LIBRARY=$OUT/_externals/openal-soft/libOpenAL32.dll.a \
	-DOPENAL_DLL=$OUT/_externals/openal-soft/OpenAL32.dll \
	\
	-DFREETYPE_INCLUDE_DIR_freetype2=/usr/x86_64-w64-mingw32/sys-root/mingw/include/\
	-DFREETYPE_INCLUDE_DIR_ft2build=/usr/x86_64-w64-mingw32/sys-root/mingw/include/freetype2/\
	-DFREETYPE_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libfreetype.dll.a \
	-DFREETYPE_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libfreetype-6.dll \
	\
	-DLEVELDB_INCLUDE_DIR=$OUT/_externals/leveldb/include \
	-DLEVELDB_LIBRARY=$OUT/_externals/leveldb/lib/libleveldb.dll.a \
	-DLEVELDB_DLL=$OUT/_externals/leveldb/bin/libleveldb.dll \
	\
	-DCUSTOM_GETTEXT_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw \
	-DGETTEXT_MSGFMT=`which msgfmt` \
	-DGETTEXT_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/libintl-8.dll \
	-DGETTEXT_ICONV_DLL=/usr/x86_64-w64-mingw32/sys-root/mingw/bin/iconv.dll \
	-DGETTEXT_INCLUDE_DIR=/usr/x86_64-w64-mingw32/sys-root/mingw/include \
	-DGETTEXT_LIBRARY=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/libintl.dll.a

make package -j$parallel

# EOF
