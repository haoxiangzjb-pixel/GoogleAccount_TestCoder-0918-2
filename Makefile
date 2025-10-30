# Makefile for C++ project
# Randomly named Makefile for build, test, and clean targets

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
LDFLAGS = 
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
TARGET = main

# Default target
all: build

# Build target
build: $(TARGET)
	@echo "Build completed successfully!"

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	@if [ -f "./$(TARGET)" ]; then \
		./$(TARGET); \
		echo "Tests completed!"; \
	else \
		echo "No executable found. Run 'make build' first."; \
	fi

# Clean target
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean completed!"

# Help target
help:
	@echo "Available targets:"
	@echo "  all     - Build the project (default)"
	@echo "  build   - Build the project"
	@echo "  test    - Run tests"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"

.PHONY: all build test clean help