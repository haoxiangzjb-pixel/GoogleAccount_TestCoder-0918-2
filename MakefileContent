# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Source directory
SRC_DIR = src

# Build directory
BUILD_DIR = build

# Test directory
TEST_DIR = test

# Executable name
TARGET = main

# Source files
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Test source files
TEST_SOURCES = $(wildcard $(TEST_DIR)/*.cpp)

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:$(TEST_DIR)/%.cpp=$(BUILD_DIR)/%_test.o)

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(BUILD_DIR) $(TARGET)
	@echo "Build completed."

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Link executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: build
	@echo "Running tests..."
	@if [ -f test_runner ]; then \
		./test_runner; \
	else \
		echo "No tests available."; \
	fi

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -f $(TARGET)
	rm -f test_runner
	@echo "Clean completed."

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Run tests"
	@echo "  clean - Remove build artifacts"
	@echo "  help  - Show this help message"