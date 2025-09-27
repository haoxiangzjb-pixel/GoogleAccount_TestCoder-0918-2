# This is a simple Makefile to compile and clean a C project.
# It assumes the source file is named hello.c and the executable is hello.

CC = gcc
CFLAGS = -Wall -g
TARGET = hello
SOURCES = hello.c

# Default target
all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

clean:
	rm -f $(TARGET)

.PHONY: all clean