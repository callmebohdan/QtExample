@echo off

setlocal

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

pushd %~dp0
cd ..
set PROJECT_DIR=%cd%
popd

set BIN_DIR=%PROJECT_DIR%\bin
set BUILD_DIR=%PROJECT_DIR%\build
set OUT_DIR=%PROJECT_DIR%\out
set QT_PATH=C:\Qt\6.7.2\msvc2019_64
set SRC_DIR=%PROJECT_DIR%\src

if exist "%BIN_DIR%" (
    echo Cleaning bin directory...
    rd /s /q "%BIN_DIR%"
)

if exist "%BUILD_DIR%" (
    echo Cleaning build directory...
    rd /s /q "%BUILD_DIR%"
)

if exist "%OUT_DIR%" (
    echo Cleaning out directory...
    rd /s /q "%OUT_DIR%"
)

echo Creating build directory...
mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"

if exist "%QT_PATH%\bin\uic.exe" (
    echo Generating QtExample.h from QtExample.ui...
    "%QT_PATH%\bin\uic.exe" -o "%SRC_DIR%\UI_QtExample.h" "%SRC_DIR%\QtExample.ui"
)

echo Configuring the project with CMake...
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_PREFIX_PATH="%QT_PATH%" "%PROJECT_DIR%"

echo Building the project with MSBuild...
msbuild "%BUILD_DIR%\QtExample.sln" /p:Configuration=Release

if exist "%QT_PATH%\bin\windeployqt.exe" (
    echo Deploying Qt libraries...
    "%QT_PATH%\bin\windeployqt.exe" --release --compiler-runtime "%BUILD_DIR%\Release\QtExample.exe"
)

if exist "%BUILD_DIR%\Release\QtExample.exe" (
    echo Copying the application into the bin/ directory...
    mkdir "%BIN_DIR%"
    xcopy /s /e /y "%BUILD_DIR%\Release\QtExample.exe" "%BIN_DIR%"
    xcopy /s /e /y "%BUILD_DIR%\Release\*.dll" "%BIN_DIR%"
    xcopy /s /e /y "%BUILD_DIR%\Release\generic" "%BIN_DIR%\generic"
    xcopy /s /e /y "%BUILD_DIR%\Release\iconengines" "%BIN_DIR%\iconengines"
    xcopy /s /e /y "%BUILD_DIR%\Release\imageformats" "%BIN_DIR%\imageformats"
    xcopy /s /e /y "%BUILD_DIR%\Release\multimedia" "%BIN_DIR%\multimedia"
    xcopy /s /e /y "%BUILD_DIR%\Release\networkinformation" "%BIN_DIR%\networkinformation"
    xcopy /s /e /y "%BUILD_DIR%\Release\platforms" "%BIN_DIR%\platforms"
    xcopy /s /e /y "%BUILD_DIR%\Release\styles" "%BIN_DIR%\styles"
    xcopy /s /e /y "%BUILD_DIR%\Release\tls" "%BIN_DIR%\tls"
) else (
    echo Error: QtExample.exe was not created.
)

endlocal
