#include <iostream>
#include <string>
#include "calculator.h"

int main() {
    std::cout << "Calculator Demo" << std::endl;
    std::cout << "5 + 3 = " << Calculator::add(5, 3) << std::endl;
    std::cout << "5 - 3 = " << Calculator::subtract(5, 3) << std::endl;
    return 0;
}