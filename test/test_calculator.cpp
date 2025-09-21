#include <iostream>
#include "../src/calculator.h"

int main() {
    std::cout << "Running Calculator tests..." << std::endl;
    
    // Test addition
    int result1 = Calculator::add(5, 3);
    if (result1 == 8) {
        std::cout << "PASS: 5 + 3 = " << result1 << std::endl;
    } else {
        std::cout << "FAIL: 5 + 3 = " << result1 << ", expected 8" << std::endl;
        return 1;
    }
    
    // Test subtraction
    int result2 = Calculator::subtract(5, 3);
    if (result2 == 2) {
        std::cout << "PASS: 5 - 3 = " << result2 << std::endl;
    } else {
        std::cout << "FAIL: 5 - 3 = " << result2 << ", expected 2" << std::endl;
        return 1;
    }
    
    std::cout << "All tests passed!" << std::endl;
    return 0;
}