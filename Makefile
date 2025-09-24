# This is a simple Makefile to compile and clean a C project.
# It assumes the source file is named main.c and the executable is named my_app.

CC = gcc
CFLAGS = -Wall -g
TARGET = my_app
SOURCES = main.c

# The first target is the default target when 'make' is run without arguments.
$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# The 'clean' target removes the compiled executable.
.PHONY: clean
clean:
	rm -f $(TARGET)

# The 'help' target prints available targets.
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all / $(TARGET): Compiles the project (default)."
	@echo "  clean: Removes the executable."
	@echo "  help: Shows this help message."