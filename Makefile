# Makefile for C++ project

# Compiler settings
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
DEBUG_FLAGS = -g -O0
RELEASE_FLAGS = -O2

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
TESTDIR = test

# Source and object files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main
TEST_TARGET = $(BINDIR)/test

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(RELEASE_FLAGS) $^ -o $@ 

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) $(DEBUG_FLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Test target
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(OBJECTS) $(wildcard $(TESTDIR)/*.cpp) | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(DEBUG_FLAGS) $(SOURCES) $(wildcard $(TESTDIR)/*.cpp) -o $@ 

# Clean target
.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Compile the project"
	@echo "  test   - Run tests"
	@echo "  clean  - Remove generated files"
	@echo "  help   - Show this help message"