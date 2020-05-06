

cmake_minimum_required(VERSION 3.8.2)

if(NOT MODULE_HELPERS_FILE)
    message(FATAL_ERROR "MODULE_HELPERS_FILE is not defined")
endif()

include("${MODULE_HELPERS_FILE}")

DefineLinuxModule(
	${CMAKE_CURRENT_SOURCE_DIR}/twsfw
	twsfw_output
	twsfw
	INCLUDES
	KERNEL_DIR
)
