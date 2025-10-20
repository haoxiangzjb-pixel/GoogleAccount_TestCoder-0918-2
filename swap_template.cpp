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
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swap_result(T& a, T& b, const std::string& filename) {
    // 先交换值
    swap_values(a, b);
    
    // 保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Swap result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 重载版本：不自动交换，只保存当前值到文件
template<typename T>
void save_current_values(const T& a, const T& b, const std::string& filename) {
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Current values:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Current values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 示例用法
int main() {
    // 示例1：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    
    std::string filename1 = generate_random_filename(".txt");
    save_swap_result(x, y, filename1);
    
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    // 示例2：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap: a = " << a << ", b = " << b << std::endl;
    
    std::string filename2 = generate_random_filename(".txt");
    save_swap_result(a, b, filename2);
    
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    // 示例3：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    std::string filename3 = generate_random_filename(".txt");
    save_swap_result(str1, str2, filename3);
    
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}