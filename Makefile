# Makefile for a generic C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = myapp

# Source files (add your .cpp files here)
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

# Test target (example, customize as needed)
test:
	@echo "Running tests..."
	./$(TARGET) --run-tests

# Clean target: remove generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all test clean