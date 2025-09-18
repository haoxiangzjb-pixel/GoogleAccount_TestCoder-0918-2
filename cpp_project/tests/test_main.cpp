#include <iostream>

// Include the test implementation
#include "../tests/test_hello.cpp"

int main() {
    test_hello();
    std::cout << "All tests passed!" << std::endl;
    return 0;
}