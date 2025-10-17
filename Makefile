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

# Main executable name
TARGET = main

# Source files (adjust these based on your actual source files)
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Executable path
EXECUTABLE = $(BUILD_DIR)/$(TARGET)

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(OBJECTS) -o $@
	@echo "Build completed: $@"

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: build
	@echo "Running tests..."
	@if [ -f "$(TEST_DIR)/test_runner" ]; then \
		$(TEST_DIR)/test_runner; \
	else \
		@echo "No test runner found. Create tests in $(TEST_DIR) directory."; \
	fi

# Clean target
.PHONY: clean
clean:
	@echo "Cleaning build files..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean completed"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Run tests (requires test runner in test directory)"
	@echo "  clean - Remove build artifacts"
	@echo "  all   - Build the project (default)"
	@echo "  help  - Show this help message"