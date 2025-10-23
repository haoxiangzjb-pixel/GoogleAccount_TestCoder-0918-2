# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Source files (adjust these based on your project)
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/program

# Test files
TEST_SOURCES = $(wildcard $(SRCDIR)/*_test.cpp)
TEST_TARGET = $(BINDIR)/test_program

.PHONY: all build test clean

# Default target
all: build

# Build target
build: $(TARGET)

# Create directories if they don't exist
$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Link the final executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Build test executable
$(TEST_TARGET): $(TEST_SOURCES) $(filter-out $(SRCDIR)/main.cpp, $(SOURCES)) | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(TEST_SOURCES) -o $(TEST_TARGET)

# Clean target
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  all     - Build the project (default)"
	@echo "  build   - Build the project"
	@echo "  test    - Build and run tests"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"