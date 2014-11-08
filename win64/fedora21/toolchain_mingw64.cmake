include( "$ENV{dir}/fedora20/toolchain_mingw64.cmake" )

set( CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} ${Mingw_Path}/libwinpthread-1.dll)
