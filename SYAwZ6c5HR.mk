# Simple Makefile for compiling a C program

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99

# Default target
all: program

# Rule for compiling the program
program: main.c
	$(CC) $(CFLAGS) -o program main.c

# Clean build artifacts
clean:
	rm -f program

# Phony targets
.PHONY: all clean