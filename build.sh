#!/bin/bash

# Define variables
src="src"
lib="lib"
bin="bin"
libname="station-perso"
temp_src="temp_src"

# Create a temporary source directory
mkdir -p "$temp_src"

# Change to the source directory
cd "$src" || exit

# Copy all Java files to the temporary source directory
find . -name '*.java' -exec cp {} "../$temp_src" \;

# Compile Java files
javac -cp "../$lib/*" -g:vars -d "../$bin" "../$temp_src"/*.java

# Change to the bin directory
cd "../$bin" || exit

# Create the JAR file
jar cvf "../ankapobeny.jar" *

# Go back to the original directory
cd ..
