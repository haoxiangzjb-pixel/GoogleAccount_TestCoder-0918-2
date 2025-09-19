#include <iostream>
#include <cassert>
#include "hello.h"

int main() {
    std::string greeting = get_greeting();
    assert(greeting == "Hello, World!");
    std::cout << "All tests passed!" << std::endl;
    return 0;
}