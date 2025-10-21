# Makefile for C++ project
# Defines build, test, and clean targets

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
TARGET = main
SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: build

# Build target
build: $(TARGET)
	@echo "Build completed successfully!"

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	@if [ -f "./test_runner" ]; then \
		./test_runner; \
	else \
		@echo "No test runner found. Create a test_runner executable or add your test commands here."; \
	fi

# Clean target
clean:
	@echo "Cleaning up build artifacts..."
	rm -f $(OBJECTS) $(TARGET) *.o

# Additional clean target to remove all generated files
distclean: clean
	@echo "Performing deep clean..."
	rm -f $(TARGET)

.PHONY: all build test clean distclean