# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g
LDLIBS = 

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build
BINDIR = bin

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_EXECUTABLES = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BINDIR)/%)

# Main executable name
TARGET = $(BINDIR)/main

# Default target
all: build

# Create directories
$(BUILDDIR) $(BINDIR):
	mkdir -p $@

# Build the main executable
build: $(BINDIR) $(BUILDDIR) $(TARGET)

# Link the main executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDLIBS)

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Run tests
test: $(TEST_EXECUTABLES)
	@echo "Running tests..."
	@for test_exec in $(TEST_EXECUTABLES); do \
		echo "Running $$test_exec..."; \
		./$$test_exec || exit 1; \
	done
	@echo "All tests passed!"

# Compile test files
$(BINDIR)/%: $(TESTDIR)/%.cpp $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDLIBS)

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR) $(BINDIR)
	
# Clean all generated files
distclean: clean
	rm -f $(TARGET) $(TEST_EXECUTABLES)

.PHONY: all build test clean distclean