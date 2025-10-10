#include <iostream>
#include <utility> // Required for std::swap

// Template function to swap two variables of any type
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a);
    a = std::move(b);
    b = std::move(temp);
}

int main() {
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    double p = 3.14, q = 2.71;
    std::cout << "Before swap: p = " << p << ", q = " << q << std::endl;
    my_swap(p, q);
    std::cout << "After swap: p = " << p << ", q = " << q << std::endl;

    return 0;
}