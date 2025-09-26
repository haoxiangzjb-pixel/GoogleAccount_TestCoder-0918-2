# Makefile for a C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Executable name
TARGET = my_program

# Test executable name
TEST_TARGET = test_$(TARGET)

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJECTS)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the test executable (example using a hypothetical test file)
test_build: test_main.cpp $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) test_main.cpp $(OBJECTS)

# Run tests (this is a placeholder, adapt to your testing framework)
test: test_build
	./$(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET) $(TEST_TARGET)

.PHONY: all test_build test clean