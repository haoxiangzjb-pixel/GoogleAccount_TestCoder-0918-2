# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 

# Define source and object directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Find all source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/program

# Test related variables
TEST_DIR = test
TEST_OBJDIR = $(OBJDIR)/test
TEST_SOURCES = $(wildcard $(TEST_DIR)/*.cpp)
TEST_OBJECTS = $(TEST_SOURCES:$(TEST_DIR)/%.cpp=$(TEST_OBJDIR)/%.o)
TEST_TARGET = $(BINDIR)/test_program

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(OBJECTS) $(TEST_OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) $(TEST_OBJECTS) -o $@ $(LDFLAGS)

$(TEST_OBJDIR)/%.o: $(TEST_DIR)/%.cpp | $(TEST_OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories
$(OBJDIR) $(TEST_OBJDIR) $(BINDIR):
	mkdir -p $@

# Clean target
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Phony targets
.PHONY: all build test clean