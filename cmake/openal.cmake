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
ExternalProject_Add(openal
	LIST_SEPARATOR :
	SOURCE_DIR "${TOP_DIR}/external/openal-soft"
	CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
	BINARY_DIR "${OUT_DIR}/_external/openal-soft"
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND ""
	TEST_COMMAND ""
	LOG_BUILD OFF)
	
set(OPENAL_INCLUDE_DIR ${TOP_DIR}/external/openal-soft/include/AL)
set(OPENAL_LIBRARY ${OUT_DIR}/_external/openal-soft/libOpenAL32.dll.a)
set(OPENAL_DLL ${OUT_DIR}/_external/openal-soft/OpenAL32.dll CACHE FILEPATH "Path to OpenAL32.dll for installation (optional)")

add_license_dir(${TOP_DIR}/external/openal-soft/COPYING openal-soft)
