#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 15);
    
    std::stringstream ss;
    ss << "random_file_";
    
    // 生成16位随机十六进制字符串
    for(int i = 0; i < 16; ++i) {
        ss << std::hex << dis(gen);
    }
    ss << extension;
    
    return ss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveToRandomFile(const T& a, const T& b, const std::string& labelA = "Value A", const std::string& labelB = "Value B") {
    std::string filename = generateRandomFileName(".txt");
    
    std::ofstream file(filename);
    if(file.is_open()) {
        file << labelA << ": " << a << std::endl;
        file << labelB << ": " << b << std::endl;
        file.close();
        std::cout << "Data saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swapValues(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    saveToRandomFile(x, y, "X", "Y");
    
    std::cout << std::endl;
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    swapValues(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    saveToRandomFile(a, b, "A", "B");
    
    std::cout << std::endl;
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swapValues(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    saveToRandomFile(str1, str2, "String 1", "String 2");
    
    return 0;
}