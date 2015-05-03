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

SET(CUSTOM_GETTEXT_PATH "${CMAKE_FIND_ROOT_PATH}"
	CACHE FILEPATH "path to custom gettext")

set(GETTEXT_INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/include)
find_program(GETTEXT_MSGFMT msgfmt)

if(WIN32)
	find_library(GETTEXT_DLL libintl-8.dll)
	find_library(GETTEXT_ICONV_DLL iconv.dll)
	find_file(GETTEXT_LIBRARY libintl.dll.a)
endif()
add_license_dir(/usr/share/doc/gettext/COPYING gettext)
add_license_dir(/usr/share/doc/gettext/COPYING.LIB gettext)

