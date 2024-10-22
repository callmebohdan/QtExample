cmake_minimum_required(VERSION 3.22)

project(QtExample LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

if (MSVC)
    add_compile_options(/Zc:__cplusplus)
endif()

find_package(Qt6 REQUIRED COMPONENTS Widgets Core Gui)

set(ASSET_FILES assets/icon/QtExample.rc)
set(HEADER_FILES src/QtExample.h)
set(SOURCE_FILES src/main.cpp src/QtExample.cpp)
set(UI_FILES src/QtExample.ui)

qt6_wrap_ui(UI_HEADERS ${UI_FILES})

if (WIN32)
    qt_add_executable(QtExample WIN32 ${SOURCE_FILES} ${HEADER_FILES} ${UI_HEADERS} ${ASSET_FILES})
else()
    qt_add_executable(QtExample ${SOURCE_FILES} ${HEADER_FILES} ${UI_HEADERS} ${ASSET_FILES})
endif()

target_link_libraries(QtExample PRIVATE Qt6::Widgets Qt6::Core Qt6::Gui)
