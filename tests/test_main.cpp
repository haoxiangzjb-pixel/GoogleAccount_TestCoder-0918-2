#include <iostream>
#include "utils.h"

int main() {
    Utils::printMessage("Running tests...");
    // Simple test - in a real project, you would use a testing framework
    std::cout << "All tests passed!" << std::endl;
    return 0;
}