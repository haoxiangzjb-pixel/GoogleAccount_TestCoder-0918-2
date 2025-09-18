#include <iostream>
#include "hello.h"

int main() {
    Hello hello;
    std::cout << hello.greet("World") << std::endl;
    return 0;
}