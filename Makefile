# Makefile for a sample C++ project
# This Makefile is saved as 'Makefile' in the /workspace directory.

CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra
LDFLAGS =

# Define your source files here. Adjust these names to match your actual files.
SOURCES = main.cpp utils.cpp
OBJECTS = $(SOURCES:.cpp=.o)
TARGET = my_program

.PHONY: all build test clean

all: build

build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test:
	@echo "Running tests..."
	# Add your test command here, for example:
	# ./run_tests
	@echo "Tests completed."

clean:
	$(RM) $(OBJECTS) $(TARGET)
	@echo "Build artifacts removed."

# An example of how to add a 'run' target to execute the built program
# run: build
# 	./$(TARGET)
