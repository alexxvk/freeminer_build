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
ExternalProject_Add(leveldb
	SOURCE_DIR "${TOP_DIR}/external/leveldb"
	CONFIGURE_COMMAND cp -r <SOURCE_DIR> ${OUT_DIR}/_external/
		COMMAND mkdir -p ${OUT_DIR}/_external/leveldb/bin
		COMMAND mkdir -p ${OUT_DIR}/_external/leveldb/lib
	BINARY_DIR "${OUT_DIR}/_external/leveldb"
	BUILD_COMMAND TARGET_OS=OS_WINDOWS_CROSSCOMPILE make libleveldb.a libleveldb.dll
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND mv libleveldb.a libleveldb.dll.a lib/
		COMMAND mv libleveldb.dll bin/
	TEST_COMMAND ""
	LOG_BUILD OFF)
	
set(LEVELDB_INCLUDE_DIR ${OUT_DIR}/_external/leveldb/include)
set(LEVELDB_LIBRARY ${OUT_DIR}/_external/leveldb/lib/libleveldb.dll.a)
set(LEVELDB_DLL ${OUT_DIR}/_external/leveldb/bin/libleveldb.dll)

add_license_dir(${TOP_DIR}/external/leveldb/LICENSE leveldb)
