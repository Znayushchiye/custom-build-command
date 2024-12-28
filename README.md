# Custom Build Command

This repository contains custom batch scripts (.bat files) for building, compiling, and executing program files from the command line. These scripts simplify the build process for different programming languages.

## Features

### 1. `build` Command:
The `build` command is used to build, compile, and execute program files based on the specified language (`type`) and file (`filename`). It currently supports the following languages:
- **C++ (cpp)**
- **Python (python)**
- **Java (java)**

#### Syntax:
```bash
build type filename [keep]
```

- **`type`**: The programming language used (either `cpp`, `python`, or `java`).
- **`filename`**: The path to the program file to be built and executed.
- **`[keep]`** (Optional): A flag that indicates whether to keep the generated executable or class files after execution.
  - For **C++**, the executable file (`.exe`) will be generated.
  - For **Java**, the compiled class file (`.class`) will be generated.
  - If this argument is not provided, the generated files will be automatically deleted after execution.

#### Example Usage:

1. **C++:**
   - Build, compile, and execute a C++ program:
     ```bash
     build cpp path\to\file.cpp
     ```
   - Keep the executable after execution:
     ```bash
     build cpp path\to\file.cpp keep
     ```

2. **Python:**
   - Execute a Python script:
     ```bash
     build python path\to\script.py
     ```

3. **Java:**
   - Compile and run a Java program:
     ```bash
     build java path\to\file.java
     ```
   - Keep the `.class` file after execution:
     ```bash
     build java path\to\file.java keep
     ```

## How It Works

- **C++**: The script uses `g++` to compile the `.cpp` file and execute the resulting `.exe` file.
- **Python**: The script directly runs the Python script using the `python` command.
- **Java**: The script uses `javac` to compile the `.java` file and runs it using the `java` command.

## Requirements

- For **C++**: You need to have `g++` (part of the MinGW or similar C++ compilers) installed and available in your PATH.
- For **Python**: Ensure Python is installed and added to your PATH.
- For **Java**: You need the Java Development Kit (JDK) installed, and both `javac` and `java` should be accessible from the command line.

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/yourusername/custom-build-command.git
   ```
2. Add the repository's location to your PATH (optional, for global access to the script).
