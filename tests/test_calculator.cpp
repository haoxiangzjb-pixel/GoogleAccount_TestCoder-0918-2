#include <iostream>
#include "calculator.h"

int main() {
    Calculator calc;
    
    // Test addition
    int result = calc.add(2, 3);
    if (result == 5) {
        std::cout << "Addition test passed!" << std::endl;
    } else {
        std::cout << "Addition test failed!" << std::endl;
        return 1;
    }
    
    // Test multiplication
    result = calc.multiply(2, 3);
    if (result == 6) {
        std::cout << "Multiplication test passed!" << std::endl;
    } else {
        std::cout << "Multiplication test failed!" << std::endl;
        return 1;
    }
    
    return 0;
}