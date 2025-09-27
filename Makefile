# This is a simple Makefile to demonstrate compile and clean targets.
# It assumes a simple C project with a main.c file and an executable named 'app'.

CC = gcc
CFLAGS = -Wall -g
TARGET = app
SOURCES = main.c

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# Clean build artifacts
clean:
	rm -f $(TARGET)

# Run the executable
run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run