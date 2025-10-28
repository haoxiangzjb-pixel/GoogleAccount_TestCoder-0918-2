#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

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
    std::uniform_int_distribution<> dis(10000, 99999);
    
    // 使用时间作为基础生成随机文件名
    auto timePoint = std::time(nullptr);
    std::string fileName = "swap_result_" + std::to_string(timePoint) + "_" + std::to_string(dis(gen)) + extension;
    return fileName;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
std::string saveSwapResult(T& a, T& b) {
    // 交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string fileName = generateRandomFileName(".txt");
    
    // 将交换后的值写入文件
    std::ofstream file(fileName);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        file.close();
        std::cout << "Swap result saved to file: " << fileName << std::endl;
        return fileName;
    } else {
        std::cerr << "Error: Could not open file for writing: " << fileName << std::endl;
        return "";
    }
}

// 重载版本，允许在交换前保存原始值
template<typename T>
std::string saveSwapResultWithOriginal(T a, T b) {
    T originalA = a;
    T originalB = b;
    
    // 交换值（只影响副本）
    swapValues(a, b);
    
    // 生成随机文件名
    std::string fileName = generateRandomFileName(".txt");
    
    // 将原始值和交换后的值都写入文件
    std::ofstream file(fileName);
    if (file.is_open()) {
        file << "Original values:\n";
        file << "Value 1: " << originalA << "\n";
        file << "Value 2: " << originalB << "\n\n";
        file << "After swap:\n";
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        file.close();
        std::cout << "Swap result with original values saved to file: " << fileName << std::endl;
        return fileName;
    } else {
        std::cerr << "Error: Could not open file for writing: " << fileName << std::endl;
        return "";
    }
}

// 另一个版本：真正交换原始变量的值并保存
template<typename T>
std::string saveSwappedValues(T& a, T& b) {
    T originalA = a;
    T originalB = b;
    
    // 交换值（影响原始变量）
    swapValues(a, b);
    
    // 生成随机文件名
    std::string fileName = generateRandomFileName(".txt");
    
    // 将原始值和交换后的值都写入文件
    std::ofstream file(fileName);
    if (file.is_open()) {
        file << "Original values:\n";
        file << "Value 1: " << originalA << "\n";
        file << "Value 2: " << originalB << "\n\n";
        file << "After swap:\n";
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        file.close();
        std::cout << "Swap result with original values saved to file: " << fileName << std::endl;
        return fileName;
    } else {
        std::cerr << "Error: Could not open file for writing: " << fileName << std::endl;
        return "";
    }
}

int main() {
    // 示例1: 整数交换
    int x = 10, y = 20;
    std::cout << "Original values: x = " << x << ", y = " << y << std::endl;
    std::string file1 = saveSwappedValues(x, y);
    std::cout << "Final values: x = " << x << ", y = " << y << std::endl;
    std::cout << std::endl;
    
    // 示例2: 浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "Original values: a = " << a << ", b = " << b << std::endl;
    std::string file2 = saveSwappedValues(a, b);
    std::cout << "Final values: a = " << a << ", b = " << b << std::endl;
    std::cout << std::endl;
    
    // 示例3: 字符串交换
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Original values: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    std::string file3 = saveSwappedValues(str1, str2);
    std::cout << "Final values: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}