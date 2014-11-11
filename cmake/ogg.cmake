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

set(OGG_INCLUDE_DIR /usr/x86_64-w64-mingw32/sys-root/mingw/include PARENT_SCOPE)
set(OGG_LIBRARY /usr/x86_64-w64-mingw32/sys-root/mingw/lib/libogg.dll.a PARENT_SCOPE)
set(OGG_DLL /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libogg-0.dll PARENT_SCOPE)
add_license_dir(/usr/share/doc/libogg/COPYING libogg)

