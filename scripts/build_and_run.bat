@echo off
setlocal

REM Save the current directory
pushd %~dp0

REM Navigate up one level from the scripts directory
cd ..

REM Store the current directory (project root) in PROJECT_DIR
set PROJECT_DIR=%cd%

REM Return to the original directory (scripts directory)
popd

set BUILD_DIR=%PROJECT_DIR%\build
set OUT_DIR=%PROJECT_DIR%\out
set QT_PATH=C:\Qt\6.7.2\mingw_64

:: Clean previous build if exists
if exist "%BUILD_DIR%" (
    echo Cleaning previous build...
    rd /s /q "%BUILD_DIR%"
)

:: Clean previous build if exists
if exist "%OUT_DIR%" (
    echo Cleaning previous build's output...
    rd /s /q "%OUT_DIR%"
)

:: Create build directory and navigate into it
echo Creating build directory...
mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"

:: Configure the project with CMake
echo Running CMake configuration...
cmake -G "MinGW Makefiles" -DCMAKE_PREFIX_PATH="%QT_PATH%" "%PROJECT_DIR%"

:: Build the project
echo Building the project...
mingw32-make

:: Deploy Qt libraries if using Qt
if exist "%QT_PATH%\bin\windeployqt.exe" (
    echo Deploying Qt libraries...
    "%QT_PATH%\bin\windeployqt.exe" "QtExample.exe"
)

:: Run the executable if it was created
if exist "%BUILD_DIR%\QtExample.exe" (
    echo Running the application...
    ".\QtExample.exe"
) else (
    echo Error: QtExample.exe was not created.
)

endlocal
pause
