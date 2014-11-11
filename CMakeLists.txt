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

cmake_minimum_required(VERSION 2.6)
if(${CMAKE_VERSION} STREQUAL "2.8.2")
	# bug http://vtk.org/Bug/view.php?id=11020
	message( WARNING "CMake/CPack version 2.8.2 will not create working .deb packages!")
endif(${CMAKE_VERSION} STREQUAL "2.8.2")

SET(TOP_DIR $ENV{TOP})
SET(OUT_DIR $ENV{OUT})
SET(SRC_DIR $ENV{TOP}/freeminer)

SET(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/cmake") 

include(license)
include(zlib)
include(curl)
include(ogg)

# Minetest itself
set(SAVE_CMAKE_SOURCE_DIR {CMAKE_SOURCE_DIR})
set(CMAKE_SOURCE_DIR ${SRC_DIR})
add_subdirectory(${SRC_DIR} ${OUT_DIR}/_freeminer)
set(CMAKE_SOURCE_DIR ${SAVE_CMAKE_SOURCE_DIR})

include(installation)
