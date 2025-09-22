#include <iostream>
#include <cassert>
#include "Calculator.h"

int main() {
    Calculator calc;
    
    // Test addition
    assert(calc.add(2, 3) == 5);
    assert(calc.add(-1, 1) == 0);
    
    // Test subtraction
    assert(calc.subtract(5, 3) == 2);
    assert(calc.subtract(0, 5) == -5);
    
    std::cout << "All tests passed!" << std::endl;
    return 0;
}