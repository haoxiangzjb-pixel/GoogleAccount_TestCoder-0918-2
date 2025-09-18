#include <iostream>
#include <cassert>
#include "hello.h"

int main() {
    Hello hello;
    std::string result = hello.greet("Test");
    assert(result == "Hello, Test!");
    std::cout << "All tests passed!" << std::endl;
    return 0;
}