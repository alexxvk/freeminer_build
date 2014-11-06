# name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER /usr/bin/x86_64-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/x86_64-w64-mingw32-g++)
SET(CMAKE_RC_COMPILER /usr/bin/x86_64-w64-mingw32-windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)

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
set( CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS ${Mingw_Path}/libgcc_s_seh-1.dll ${Mingw_Path}/libstdc++-6.dll ${Mingw_Path}/libbz2-1.dll ${Mingw_Path}/libpng16-16.dll ${Mingw_Path}/libcrypto-10.dll ${Mingw_Path}/libidn-11.dll ${Mingw_Path}/libssh2-1.dll ${Mingw_Path}/libssl-10.dll)


