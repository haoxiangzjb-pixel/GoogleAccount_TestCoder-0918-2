// Test file for hello function
#include <iostream>
#include "../src/hello.h"

void test_hello() {
    std::cout << "Running test..." << std::endl;
    hello();
    std::cout << "Test completed successfully!" << std::endl;
}