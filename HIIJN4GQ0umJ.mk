# C++ Project Makefile

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

# Source directory
SRC_DIR = src

# Test directory
TEST_DIR = test

# Build directory
BUILD_DIR = build

# Executable name
TARGET = main

# Source files (adjust these based on your project)
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
build: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(OBJECTS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: build_tests run_tests

.PHONY: build_tests
build_tests: $(TEST_OBJECTS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(TEST_OBJECTS) -o $(BUILD_DIR)/test_runner

$(BUILD_DIR)/%_test.o: $(TEST_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: run_tests
run_tests: build_tests
	@echo "Running tests..."
	$(BUILD_DIR)/test_runner

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	@echo "Build directory cleaned."

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Build and run tests"
	@echo "  clean - Remove build artifacts"
	@echo "  help  - Show this help message"