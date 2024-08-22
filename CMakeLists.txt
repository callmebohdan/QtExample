cmake_minimum_required(VERSION 3.22)

project(QtExample)

set(CMAKE_CXX_STANDARD 11)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(ASSET_FILES assets/QtExample.rc)
set(HEADER_FILES src/mainwindow.h)
set(SOURCE_FILES src/main.cpp src/mainwindow.cpp)
set(UI_FILES src/mainwindow.ui)

qt_add_executable(QtExample ${SOURCE_FILES} ${HEADER_FILES} ${UI_FILES} ${ASSET_FILES})

target_link_libraries(QtExample PRIVATE Qt6::Widgets)

set_target_properties(QtExample PROPERTIES WIN64_EXECUTABLE ON)
