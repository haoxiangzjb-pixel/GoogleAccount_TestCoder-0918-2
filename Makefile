# This is a simple Makefile to compile and clean a C project.

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -g

# Target executable name
TARGET = my_program

# Source files
SOURCES = main.c utils.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target to remove generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all clean