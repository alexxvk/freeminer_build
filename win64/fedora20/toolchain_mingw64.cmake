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

# name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER /usr/bin/x86_64-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/x86_64-w64-mingw32-g++)
SET(CMAKE_RC_COMPILER /usr/bin/x86_64-w64-mingw32-windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32/sys-root/mingw)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set( Mingw_Path /usr/x86_64-w64-mingw32/sys-root/mingw/bin/)
# We need libbz2-1.dll, libpng16-16.dll to use fedora freetype.dll
# We need libcrypto-10.dll, libidn-11.dll, libssh2-1.dll, libssl-10.dll
# to use fedora curl
# LUA_LIBRARY is here now but will be removed later
set( CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS ${Mingw_Path}/libgcc_s_seh-1.dll ${Mingw_Path}/libstdc++-6.dll ${Mingw_Path}/libbz2-1.dll ${Mingw_Path}/libpng16-16.dll ${Mingw_Path}/libcrypto-10.dll ${Mingw_Path}/libidn-11.dll ${Mingw_Path}/libssh2-1.dll ${Mingw_Path}/libssl-10.dll ${LUA_LIBRARY} ${Mingw_Path}/libsqlite3-0.dll)

