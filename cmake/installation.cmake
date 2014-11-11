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

get_directory_property(SHAREDIR DIRECTORY ${SRC_DIR}
                       DEFINITION SHAREDIR)
get_directory_property(BINDIR DIRECTORY ${SRC_DIR}
                       DEFINITION BINDIR)
get_directory_property(DOCDIR DIRECTORY ${SRC_DIR}
                       DEFINITION DOCDIR)

# We install games
install(DIRECTORY "${SRC_DIR}/games" DESTINATION "${SHAREDIR}"
	PATTERN ".git" EXCLUDE
	PATTERN ".gitignore" EXCLUDE)

# We install windows runtime
if(WIN32)
	if(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS)
		install(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION ${BINDIR})
	endif()
endif()

# Licenses
install(FILES ${LICENSE_FILES} DESTINATION ${DOCDIR})

foreach(var ${LICENSE_DIR})
	string(REPLACE ":" ";" var2 ${var})
	list(GET var2 0 license_file)
	list(LENGTH var2 len)
	list(GET var2 1 license_dir)
	install(FILES ${license_file} DESTINATION ${DOCDIR}/${license_dir})
endforeach(var)

# Manifest
execute_process(COMMAND repo manifest -r -o ${OUT_DIR}/manifest.xml)
install(FILES ${OUT_DIR}/manifest.xml DESTINATION ${DOCDIR})

