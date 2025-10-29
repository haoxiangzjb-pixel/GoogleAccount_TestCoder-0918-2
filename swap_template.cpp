#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swap_values(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generate_random_filename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::stringstream ss;
    ss << "swap_output_" << dis(gen) << extension;
    return ss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swapped_values(T& a, T& b, const std::string& description = "") {
    // 先交换值
    swap_values(a, b);
    
    // 生成随机文件名
    std::string filename = generate_random_filename(".txt");
    
    // 写入文件
    std::ofstream file(filename);
    if (file.is_open()) {
        if (!description.empty()) {
            file << "Description: " << description << std::endl;
        }
        file << "Value A after swap: " << a << std::endl;
        file << "Value B after swap: " << b << std::endl;
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例1：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    save_swapped_values(x, y, "Integer swap example");
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl << std::endl;
    
    // 示例2：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    save_swapped_values(a, b, "Double swap example");
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl << std::endl;
    
    // 示例3：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    save_swapped_values(str1, str2, "String swap example");
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl << std::endl;
    
    return 0;
}