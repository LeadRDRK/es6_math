cmake_minimum_required(VERSION 3.0.0)
if ("${CMAKE_BINARY_DIR}" STREQUAL "${CMAKE_SOURCE_DIR}") 
    message(FATAL_ERROR "In-source builds are not allowed.")
endif()
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")

project(es6_math)
if (NOT DEFINED BUILD_SHARED_LIBS)
    # Default to true
    set(BUILD_SHARED_LIBS TRUE)
endif()
add_library(es6_math src/es6_math.c)