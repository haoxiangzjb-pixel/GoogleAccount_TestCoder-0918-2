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
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 9);
    
    std::string filename = "random_";
    
    // 生成10位数字作为随机文件名
    for(int i = 0; i < 10; i++) {
        filename += std::to_string(dis(gen));
    }
    
    filename += extension;
    return filename;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwappedValuesToFile(T& a, T& b, const std::string& description = "") {
    // 先交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string filename = generateRandomFilename(".txt");
    
    // 打开文件进行写入
    std::ofstream file(filename);
    if(file.is_open()) {
        file << "Swapped Values:\n";
        if(!description.empty()) {
            file << "Description: " << description << "\n";
        }
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        file.close();
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 主函数演示用法
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    saveSwappedValuesToFile(x, y, "Integer swap test");
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl;
    
    std::cout << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    saveSwappedValuesToFile(a, b, "Double swap test");
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl;
    
    std::cout << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    saveSwappedValuesToFile(str1, str2, "String swap test");
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    return 0;
}