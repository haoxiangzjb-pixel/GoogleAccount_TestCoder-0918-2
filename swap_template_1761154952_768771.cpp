#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// C++模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名的辅助函数
std::string generateRandomFileName(const std::string& extension = ".cpp") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999);
    
    std::time_t now = std::time(0);
    std::string filename = "swap_template_" + std::to_string(now) + "_" + std::to_string(dis(gen)) + extension;
    return filename;
}

int main() {
    // 示例：交换不同类型的变量
    int x = 10, y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;
    
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;
    
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}
