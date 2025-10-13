# Sample C++ Makefile
# This Makefile demonstrates build, test, and clean targets.
# It compiles a simple C++ project consisting of a main file and one source file in a 'src' directory.
# The executable is named 'my_app' and placed in a 'bin' directory.
# Tests are expected to be run by an executable named 'test_runner'.

# Define variables for the compiler, flags, directories, and executable name.
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
SRCDIR = src
BUILDDIR = build
TARGETDIR = bin
TARGET = $(TARGETDIR)/my_app
TEST_RUNNER = $(TARGETDIR)/test_runner

# The 'all' target is the default target that will be built if 'make' is run without arguments.
# It depends on the 'build' target.
all: build

# The 'build' target compiles the source code.
# It first creates the necessary output directories.
# It then finds all .cpp files in the SRCDIR, compiles them into object files in BUILDDIR,
# and links those object files into the final executable in TARGETDIR.
build: $(TARGET)

$(TARGET): $(SRCDIR)/*.cpp | $(TARGETDIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(TARGETDIR):
	mkdir -p $(TARGETDIR)

# The 'test' target runs the test suite.
# It depends on the 'build' target to ensure the test runner is up-to-date.
# It executes the test runner if it exists.
test: build
	@if [ -x $(TEST_RUNNER) ]; then \
		echo "Running tests..."; \
		$(TEST_RUNNER); \
	else \
		echo "Test runner $(TEST_RUNNER) not found. Please build tests first."; \
	fi

# The 'clean' target removes all generated files.
# It deletes the build directory (BUILDDIR) and the target directory (TARGETDIR).
clean:
	$(RM) -r $(BUILDDIR) $(TARGETDIR)

# The 'phony' target declares other targets as 'phony', meaning they don't represent files.
# This prevents conflicts if a file with the same name as a target is created.
.PHONY: all build test clean