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

# Main executable
TARGET = $(BINDIR)/main

# Default target
all: $(TARGET)

# Create directories
$(BUILDDIR) $(BINDIR):
	mkdir -p $@

# Build main executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDLIBS)

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp | $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Test target
test: $(BINDIR)/test_main
	@echo "Running tests..."
	@for test_exec in $(BINDIR)/test_main; do \
		if [ -f "$$test_exec" ]; then \
			echo "Running $$test_exec..."; \
			$$test_exec || exit 1; \
		fi \
	done
	@echo "All tests passed!"

# Compile test files
$(BINDIR)/test_main: $(TESTDIR)/test_main.cpp $(BUILDDIR)/hello.o | $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDLIBS)

# Clean target
clean:
	rm -rf $(BUILDDIR) $(BINDIR)
	@echo "Cleaned build artifacts."

# Phony targets
.PHONY: all test clean