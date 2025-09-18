# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -I./include

# Directories
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build
TEST_DIR = tests

# Source files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Test files
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJS = $(TEST_SRCS:$(TEST_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Targets
TARGET = $(BUILD_DIR)/main
TEST_TARGET = $(BUILD_DIR)/test_runner

# Default target
.PHONY: all
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJS) | $(BUILD_DIR)
	$(CXX) $(OBJS) -o $@

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build and run tests
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Create test executable
$(TEST_TARGET): $(OBJS) $(TEST_OBJS) | $(BUILD_DIR)
	$(CXX) $(OBJS) $(TEST_OBJS) -lgtest -lgtest_main -pthread -o $@

# Compile test files
$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Install dependencies (Ubuntu/Debian)
.PHONY: install-deps
install-deps:
	sudo apt-get update && sudo apt-get install -y libgtest-dev cmake
	cd /usr/src/gtest && sudo cmake CMakeLists.txt && sudo make && sudo cp libgtest*.a /usr/lib