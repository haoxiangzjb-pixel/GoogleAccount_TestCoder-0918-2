# Makefile for a simple C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = my_program

# Source files
SOURCES = main.cpp

# Object files (derived from source files)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the project (alias for 'all')
build: all

# Run tests (placeholder)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./run_tests
	@echo "Tests completed."

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all build test clean