# This is a simple Makefile to compile and clean a C project.
# It assumes the source file is named main.c and the executable is named my_program.

CC = gcc
CFLAGS = -Wall -g
TARGET = my_program
SOURCE = main.c

# The 'all' target is the default target that builds the program.
all: $(TARGET)

$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# The 'clean' target removes the compiled executable.
clean:
	rm -f $(TARGET)

# The 'help' target prints available targets.
help:
	@echo "Available targets:"
	@echo "  all   - Compiles the program (default)"
	@echo "  clean - Removes the compiled executable"
	@echo "  help  - Shows this help message"

.PHONY: all clean help