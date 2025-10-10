# Define the compiler
CXX = g++

# Define any compiler flags (e.g., warnings, debug info)
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Define the name of the executable
TARGET = my_app

# Define source files (adjust these based on your project)
SOURCES = main.cpp utils.cpp

# Define object files based on source files
OBJECTS = $(SOURCES:.cpp=.o)

# Define the test executable name
TEST_TARGET = test_$(TARGET)

# Define test source files (adjust these based on your project)
TEST_SOURCES = test_main.cpp test_utils.cpp

# Define test object files based on test source files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Build the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the test executable
test_build: $(TEST_OBJECTS) $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $^

# Run tests (this assumes a simple executable that returns 0 on success)
test: test_build
	./$(TEST_TARGET)

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

# Declare phony targets for safety
.PHONY: all test_build test clean