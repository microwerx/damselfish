cmake_minimum_required(VERSION 3.16)
project(damselfish)

set(CMAKE_C_STANDARD            99)
set(CMAKE_C_STANDARD_REQUIRED   ON)
set(CMAKE_CXX_EXTENSIONS        OFF)
set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if (APPLE)
    include_directories(/usr/local/include)
endif()

include_directories(${PROJECT_SOURCE_DIR}/include)

add_library(${PROJECT_NAME} STATIC
	src/damselfish.cpp
	src/damselfish_json.cpp
	src/damselfish_lexer.cpp
	src/damselfish_python.cpp
	src/damselfish_variable_list.cpp
    )

if(${CMAKE_VERSION} VERSION_GREATER "3.16.0")
    message("Damselfish using precompiled headers")
    target_precompile_headers(${PROJECT_NAME} PRIVATE src/damselfish_pch.cpp)
endif()