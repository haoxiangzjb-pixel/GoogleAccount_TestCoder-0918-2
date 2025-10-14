#include <iostream>

template<typename T>
void my_swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    double m = 1.5, n = 2.5;
    std::cout << "Before swap: m = " << m << ", n = " << n << std::endl;
    my_swap(m, n);
    std::cout << "After swap: m = " << m << ", n = " << n << std::endl;

    return 0;
}