# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Source directory
SRCDIR = src

# Build directory
BUILDDIR = build

# Test directory
TESTDIR = test

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executable name
TARGET = myapp

# Test executable name
TEST_TARGET = test_$(TARGET)

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)
	@echo "Build complete: $(TARGET)"

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: test_build run_tests

.PHONY: test_build
test_build: $(SOURCES) $(wildcard $(TESTDIR)/*.cpp)
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(SOURCES) $(wildcard $(TESTDIR)/*.cpp) -o $(TEST_TARGET)
	@echo "Test build complete: $(TEST_TARGET)"

.PHONY: run_tests
run_tests: test_build
	./$(TEST_TARGET)
	@echo "Tests completed"

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILDDIR)/*.o $(TARGET) $(TEST_TARGET)
	@echo "Clean complete"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Build the project (default)"
	@echo "  build   - Build the project"
	@echo "  test    - Build and run tests"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"