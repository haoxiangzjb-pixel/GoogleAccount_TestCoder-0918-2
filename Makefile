# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
SRCDIR = src
OBJDIR = obj
BINDIR = bin
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CXX) $(OBJECTS) -o $@
	@echo "Build completed successfully!"

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	@if [ -f $(BINDIR)/test ]; then \
		$(BINDIR)/test; \
	else \
		echo "No test executable found. Build tests first."; \
	fi

# Clean target
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OBJDIR) $(BINDIR)
	@echo "Clean completed!"

.PHONY: all build test clean