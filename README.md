# custom-build-command

This repository will store custom batch scripts (.bat files) that I make for 
custom command line commands.

1. build type filename [keep]:
  This command is used to build, compile and execute any program file given in "filename"
  and languange specified by "type". It currently supports java, cpp and python.
  [keep] is an optional argument that tells the script whether to keep the executable files
  after the code execution. In case of cpp, it is the .exe file and in case of java it is
  the .class file.

  Usage example,
  build java HelloWorld.java keep
  build python "python\Test files\test.py"
  build cpp .\main.cpp
