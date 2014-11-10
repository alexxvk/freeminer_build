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

set(SAVE_CMAKE_SOURCE_DIR {CMAKE_SOURCE_DIR})
set(CMAKE_SOURCE_DIR ${TOP_DIR}/minetest)
add_subdirectory(${TOP_DIR}/minetest ${OUT_DIR}/_minetest)
set(CMAKE_SOURCE_DIR ${SAVE_CMAKE_SOURCE_DIR})

get_directory_property(SHAREDIR DIRECTORY ${TOP_DIR}/minetest
                       DEFINITION SHAREDIR)
get_directory_property(BINDIR DIRECTORY ${TOP_DIR}/minetest
                       DEFINITION BINDIR)

install(DIRECTORY "${TOP_DIR}/minetest/games" DESTINATION "${SHAREDIR}"
	PATTERN ".git" EXCLUDE
	PATTERN ".gitignore" EXCLUDE)

if(WIN32)
	if(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS)
		install(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION ${BINDIR})
	endif()
endif()
