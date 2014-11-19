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

# It seems there is a bug in find_package for mingw32
set(FREETYPE_INCLUDE_DIR_ft2build ${CMAKE_FIND_ROOT_PATH}/include/freetype2)
set(FREETYPE_INCLUDE_DIR_freetype2 ${CMAKE_FIND_ROOT_PATH}/include)
find_package(Freetype QUIET)

if(FREETYPE_FOUND)
	if(WIN32)
		find_file(FREETYPE_DLL libfreetype-6.dll)
	endif()
	add_license_dir(/usr/share/doc/mingw64-freetype/LICENSE.TXT freetype2)
else()
	#We need to build it ourself
endif()

