#!/bin/bash

set -e

export QT_QPA_PLATFORM=xcb

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR/.."
PROJECT_DIR=$(pwd)

BIN_DIR="$PROJECT_DIR/bin"
BUILD_DIR="$PROJECT_DIR/build"
OUT_DIR="$PROJECT_DIR/out"
SRC_DIR="$PROJECT_DIR/src"

QT_PATH="/usr/lib/x86_64-linux-gnu/cmake/Qt6"
QT_LIB_PATH="/usr/lib/x86_64-linux-gnu"

if [ -d "$BIN_DIR" ]; then
    echo "Cleaning bin/ directory..."
    rm -rf "$BIN_DIR"
fi

if [ -d "$BUILD_DIR" ]; then
    echo "Cleaning build/ directory..."
    rm -rf "$BUILD_DIR"
fi

if [ -d "$OUT_DIR" ]; then
    echo "Cleaning bin/ directory..."
    rm -rf "$BIN_DIR"
fi

echo "Creating build/ directory..."
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "Running CMake configuration..."
cmake -G "Unix Makefiles" -DCMAKE_PREFIX_PATH="$QT_PATH" "$PROJECT_DIR"

echo "Generate ui_qtexample.h"
uic "$SRC_DIR/QtExample.ui" -o "$SRC_DIR/ui_qtexample.h"

echo "Building the project..."
make

if [ -f "$BUILD_DIR/QtExample" ]; then
    mkdir -p "$BIN_DIR"
    echo "Copying the application into the bin/ directory..."
    cp "$BUILD_DIR/QtExample" "$BIN_DIR"
    cp "$QT_LIB_PATH/libQt6Core.so.6" "$BIN_DIR"
    cp "$QT_LIB_PATH/libQt6Gui.so.6" "$BIN_DIR"
    cp "$QT_LIB_PATH/libQt6Widgets.so.6" "$BIN_DIR"
else
    echo "Error: QtExample was not created."
    exit 1
fi

if [ -f "$BIN_DIR/QtExample" ]; then
    echo "Running the application..."
    "$BIN_DIR/QtExample"
else
    echo "Error: QtExample was not created."
    exit 1
fi
