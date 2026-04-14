#include <iostream>

// 模板函数：交换两个变量的值
template <typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swapValues(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    swapValues(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;

    return 0;
}
