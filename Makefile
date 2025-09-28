# Define the compiler
CXX = g++

# Define any compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Define the target executable name
TARGET = my_program

# Define source files
SOURCES = main.cpp utils.cpp

# Define object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build target
build: $(TARGET)
	@echo "Build complete."

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./run_tests
	@echo "Tests finished."

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean complete."

# Phony targets
.PHONY: all build test clean