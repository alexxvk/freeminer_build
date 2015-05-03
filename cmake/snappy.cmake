include(ExternalProject)
ExternalProject_Add(snappy
	LIST_SEPARATOR :
	SOURCE_DIR "${TOP_DIR}/external/snappy"
	CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}		
	BINARY_DIR "${OUT_DIR}/_external/snappy"
	BUILD_IN_SOURCE 0
	INSTALL_COMMAND ""
	TEST_COMMAND ""
	LOG_BUILD OFF)

set(SNAPPY_INCLUDE_DIR ${TOP_DIR}/external/snappy)
set(SNAPPY_LIBRARY ${OUT_DIR}/_external/snappy/libsnappy.a)

add_license_dir(${TOP_DIR}/external/snappy/COPYING snappy)