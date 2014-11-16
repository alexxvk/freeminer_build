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
ExternalProject_Add(luajit
	SOURCE_DIR "${TOP_DIR}/external/LuaJIT"
	CONFIGURE_COMMAND cp -r <SOURCE_DIR> ${OUT_DIR}/_external/
	BINARY_DIR "${OUT_DIR}/_external/LuaJIT"
	BUILD_COMMAND make CROSS=x86_64-w64-mingw32- TARGET_SYS=Windows
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND ""
	TEST_COMMAND ""
	LOG_BUILD OFF)
	
set(LUA_INCLUDE_DIR ${OUT_DIR}/_external/LuaJIT/src)
set(LUA_LIBRARY ${OUT_DIR}/_external/LuaJIT/src/lua51.dll)

add_license_dir(${TOP_DIR}/external/LuaJIT/COPYRIGHT LuaJIT)
