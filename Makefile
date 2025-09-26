# Makefile for a sample C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = my_app

# Source files
SOURCES = main.cpp src/utils.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = test_runner

# Test source files
TEST_SOURCES = tests/test_main.cpp tests/test_utils.cpp src/utils.cpp

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: build

# Build the main executable
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS)
	$(CXX) $(TEST_OBJECTS) -o $(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

.PHONY: all build test clean