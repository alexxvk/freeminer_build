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
include(ExternalProject)
ExternalProject_Add(irrlicht
#DEPENDS zlib
	LIST_SEPARATOR :
	SOURCE_DIR "${TOP_DIR}/external/irrlicht"
	CONFIGURE_COMMAND cp -r <SOURCE_DIR> ${OUT_DIR}/_external/
		COMMAND mkdir -p ${OUT_DIR}/_external/irrlicht/bin/Win64-gcc
		COMMAND mkdir -p ${OUT_DIR}/_external/irrlicht/lib/Win64-gcc
	BINARY_DIR "${OUT_DIR}/_external/irrlicht/source/Irrlicht"
	BUILD_COMMAND sed -i "s/Win32-gcc/Win64-gcc/g" Makefile Irrlicht-gcc.cbp Irrlicht.dev
		COMMAND sed -i "s%ld3dx9d%ld3dx9_43 -lz%g" Makefile
		COMMAND sed -i "/ZLIBOBJ = /d" Makefile
		COMMAND sed -i "s/ ..(ZLIBOBJ)//" Makefile
		COMMAND sed -i "s%-Izlib%-I${ZLIB_INCLUDE_DIR}%g" Makefile
		COMMAND sed -i "s/-DNO_IRR_COMPILE_WITH_DIRECT3D_9_//" Makefile
		# BUG in d3d9.h (mingw64)
		# http://sourceforge.net/p/mingw-w64/bugs/409/
		COMMAND sed -i "s/D3DPRESENT_LINEAR_CONTENT/0x00000002L/g" CD3D9Driver.cpp
		COMMAND make win32
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND ""
	TEST_COMMAND ""
	LOG_BUILD OFF)
	
set(IRRLICHT_INCLUDE_DIR ${OUT_DIR}/_external/irrlicht/include)
set(IRRLICHT_LIBRARY ${OUT_DIR}/_external/irrlicht/lib/Win64-gcc/libIrrlicht.a)
set(IRRLICHT_DLL ${OUT_DIR}/_external/irrlicht/bin/Win64-gcc/Irrlicht.dll)

add_license_dir(${TOP_DIR}/external/irrlicht/readme.txt irrlicht)
