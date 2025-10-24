# Makefile for compilation and cleanup

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2

# Target executable name
TARGET = program

# Source files
SOURCES = main.c utils.c
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Compilation
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all (including any temporary files)
clean-all: clean
	rm -f *.o *.tmp *~

# Phony targets
.PHONY: all clean clean-all