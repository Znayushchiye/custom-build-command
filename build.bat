@echo off
echo Building script...

:: Check if at least two arguments are provided
if "%~1"=="" (
    echo Usage: build type filename [keep]
    exit /b 1
)
if "%~2"=="" (
    echo Usage: build type filename [keep]
    exit /b 1
)

:: Parse arguments
set type=%~1
set filepath=%~2
set keep=%~3

:: Check if the file exists
if not exist "%filepath%" (
    echo File "%filepath%" not found!
    exit /b 1
)

:: Extract directory, filename, and base name
for %%I in ("%filepath%") do (
    set dirpath=%%~dpI
    set filename=%%~nxI
    set basename=%%~nI
)

:: Debugging output (Uncomment to debug)
@REM echo Build type: %type%
@REM echo Entered File Path: %filepath%
@REM echo Full Directory Path: %dirpath%
@REM echo File Name with extension: %filename%
@REM echo Base File Name: %basename%

:: Check if required tools are installed
if /i "%type%"=="cpp" (
    where g++ >nul 2>&1 || (
        echo g++ not found. Please install it or ensure it's in your PATH.
        exit /b 1
    )
) else if /i "%type%"=="python" (
    where python >nul 2>&1 || (
        echo Python not found. Please install it or ensure it's in your PATH.
        exit /b 1
    )
) else if /i "%type%"=="java" (
    where javac >nul 2>&1 || (
        echo javac not found. Please install it or ensure it's in your PATH.
        exit /b 1
    )
    where java >nul 2>&1 || (
        echo java not found. Please install it or ensure it's in your PATH.
        exit /b 1
    )
)

:: Handle type and compile/execute logic
if /i "%type%"=="cpp" (
    echo Compiling C++ file...
    g++ "%filepath%" -o "%basename%.exe"
    if not exist "%basename%.exe" (
        echo Compilation failed.
        exit /b 1
    )
    "%basename%.exe"

    :: Automatically delete .exe unless 'keep' is specified
    if /i "%keep%"=="keep" (
        echo Keeping the executable.
    ) else (
        del "%basename%.exe"
        echo Deleted the executable.
    )
) else if /i "%type%"=="python" (
    echo Executing Python script...
    python "%filepath%"
) else if /i "%type%"=="java" (
    echo Compiling Java file...
    javac "%filepath%"
    if not exist "%dirpath%%basename%.class" (
        echo Compilation failed.
        exit /b 1
    )
    java -cp "%dirpath%" "%basename%"

    :: Automatically delete .class unless 'keep' is specified
    if /i "%keep%"=="keep" (
        echo Keeping the .class file.
    ) else (
        del "%dirpath%%basename%.class"
        echo Deleted the .class file.
    )
) else (
    echo Unsupported language: %type%
    exit /b 1
)
