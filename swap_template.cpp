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
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
bool saveSwapResult(T& a, T& b, const std::string& filename) {
    std::ofstream file(filename);
    if (!file.is_open()) {
        return false;
    }
    
    file << "After swap:\n";
    file << "Value A: " << a << "\n";
    file << "Value B: " << b << "\n";
    
    file.close();
    return true;
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    
    swapValues(x, y);
    
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    // 生成随机文件名并保存结果
    std::string filename = generateRandomFilename(".txt");
    if (saveSwapResult(x, y, filename)) {
        std::cout << "Swap result saved to: " << filename << std::endl;
    } else {
        std::cout << "Failed to save result to file." << std::endl;
    }
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap: a = " << a << ", b = " << b << std::endl;
    
    swapValues(a, b);
    
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    // 生成另一个随机文件名并保存结果
    std::string filename2 = generateRandomFilename(".txt");
    if (saveSwapResult(a, b, filename2)) {
        std::cout << "Swap result saved to: " << filename2 << std::endl;
    } else {
        std::cout << "Failed to save result to file." << std::endl;
    }
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    swapValues(str1, str2);
    
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    // 生成另一个随机文件名并保存结果
    std::string filename3 = generateRandomFilename(".txt");
    if (saveSwapResult(str1, str2, filename3)) {
        std::cout << "Swap result saved to: " << filename3 << std::endl;
    } else {
        std::cout << "Failed to save result to file." << std::endl;
    }
    
    return 0;
}