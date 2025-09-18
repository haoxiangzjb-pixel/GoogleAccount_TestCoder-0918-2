# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
INCLUDES = -I./include
LIBS = 

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build

# Source files (excluding main and test files)
SOURCES = $(filter-out $(SRCDIR)/main.cpp $(SRCDIR)/test.cpp,$(wildcard $(SRCDIR)/*.cpp))
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(SRCDIR)/test.cpp
TEST_OBJECTS = $(TEST_SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_EXECUTABLE = $(BUILDDIR)/test_runner

# Main executable
MAIN_SOURCES = $(SRCDIR)/main.cpp
MAIN_OBJECTS = $(MAIN_SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
EXECUTABLE = $(BUILDDIR)/main

# Default target
all: $(EXECUTABLE)

# Build the main executable
$(EXECUTABLE): $(MAIN_OBJECTS) $(OBJECTS) | $(BUILDDIR)
	$(CXX) $(MAIN_OBJECTS) $(OBJECTS) -o $@ $(LIBS)

# Build and run tests
test: $(TEST_EXECUTABLE)
	./$(TEST_EXECUTABLE)

$(TEST_EXECUTABLE): $(TEST_OBJECTS) $(OBJECTS) | $(BUILDDIR)
	$(CXX) $(TEST_OBJECTS) $(OBJECTS) -o $@ $(LIBS)

# Compile source files to object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Phony targets
.PHONY: all clean test