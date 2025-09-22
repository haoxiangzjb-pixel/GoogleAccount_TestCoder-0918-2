#include <iostream>
#include "Calculator.h"

int main() {
    Calculator calc;
    std::cout << "Addition: 5 + 3 = " << calc.add(5, 3) << std::endl;
    std::cout << "Subtraction: 5 - 3 = " << calc.subtract(5, 3) << std::endl;
    return 0;
}