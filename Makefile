# Simple Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -Iinclude

# Directories
SRC_DIR = src
INC_DIR = include
TEST_DIR = tests
BUILD_DIR = build
BIN_DIR = bin

# Create directories if they don't exist
$(shell mkdir -p $(BUILD_DIR) $(BIN_DIR))

# Source files (excluding main.cpp)
SRCS = $(filter-out $(SRC_DIR)/main.cpp,$(wildcard $(SRC_DIR)/*.cpp))
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Test files
TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_BINS = $(TEST_SRCS:$(TEST_DIR)/%.cpp=$(BIN_DIR)/%)

# Main executable
TARGET = $(BIN_DIR)/main

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJS) $(BUILD_DIR)/main.o
	$(CXX) $(OBJS) $(BUILD_DIR)/main.o -o $@

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Compile main separately
$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Test target
test: $(TEST_BINS)
	@for test_bin in $(TEST_BINS); do \
		echo "Running $$test_bin..."; \
		$$test_bin || exit 1; \
	done

# Compile test files
$(BIN_DIR)/%: $(TEST_DIR)/%.cpp $(OBJS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $< $(OBJS) -o $@

# Clean target
clean:
	rm -rf $(BUILD_DIR)/* $(BIN_DIR)/*

# Phony targets
.PHONY: all clean test