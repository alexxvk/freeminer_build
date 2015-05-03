include(ExternalProject)
ExternalProject_Add(msgpack
	LIST_SEPARATOR :
	SOURCE_DIR "${TOP_DIR}/external/msgpack"
	CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
	BINARY_DIR "${OUT_DIR}/_external/msgpack"
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND ""
	TEST_COMMAND ""
	LOG_BUILD OFF)

set(MSGPACK_INCLUDE_DIR ${TOP_DIR}/external/msgpack/include)
set(MSGPACK_LIBRARY ${OUT_DIR}/_external/msgpack/libmsgpack.a)
set(MSGPACK_DLL ${OUT_DIR}/_external/msgpack/libmsgpack.dll)

add_license_dir(${TOP_DIR}/external/msgpack/COPYING msgpack)