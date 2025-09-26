# This is a simple Makefile to compile and clean a C project.

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -g

# Target executable name
TARGET = myprogram

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

# Clean build files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Run the program (after building)
run: all
	./$(TARGET)

.PHONY: all clean run