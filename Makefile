# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
TARGET = app

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (example - customize as needed)
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./test_runner
	# Or use a testing framework like Google Test, Catch2, etc.
	@echo "Tests completed."

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Additional clean for test files if needed
clean-all: clean
	rm -f test_* *_test

.PHONY: all build test clean clean-all