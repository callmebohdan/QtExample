cmake_minimum_required(VERSION 3.22)

project(QtExample LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if (MSVC)
    add_compile_options(/Zc:__cplusplus)
endif()

find_package(Qt6 REQUIRED COMPONENTS Widgets Core Gui)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(ASSET_FILES assets/icon/QtExample.rc)
set(HEADER_FILES src/QtExample.h)
set(SOURCE_FILES src/main.cpp src/QtExample.cpp)
set(UI_FILES src/QtExample.ui)

add_executable(QtExample ${SOURCE_FILES} ${HEADER_FILES} ${UI_FILES} ${ASSET_FILES})

target_link_libraries(QtExample PRIVATE Qt6::Widgets Qt6::Core Qt6::Gui)

if (WIN32)
    set_target_properties(QtExample PROPERTIES WIN64_EXECUTABLE ON LINK_FLAGS "-mwindows")
endif()
