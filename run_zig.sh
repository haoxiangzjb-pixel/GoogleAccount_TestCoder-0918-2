#!/bin/bash

# Проверяем, установлен ли Zig
if command -v zig &> /dev/null; then
    echo "Zig found. Compiling and running the program..."
    zig run point_struct.zig
else
    echo "Zig is not installed. The Zig code is saved in point_struct.zig file."
    echo "To run the program, please install Zig first and then execute: zig run point_struct.zig"
    echo "Alternatively, you can compile it with: zig build-exe point_struct.zig"
    echo "And then run the executable."
fi