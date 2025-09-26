#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数：交换两个变量的值
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 创建随机数生成器以生成随机文件名
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);

    // 生成随机文件名
    std::string filename = "swap_output_" + std::to_string(dis(gen)) + ".txt";
    std::cout << "Generated random filename: " << filename << std::endl;

    // 使用随机文件名创建输出文件流
    std::ofstream outFile(filename);

    if (!outFile) {
        std::cerr << "Error opening file for writing!" << std::endl;
        return 1;
    }

    // 测试交换函数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // 将结果写入随机命名的文件
    outFile << "Before swap: x = " << 10 << ", y = " << 20 << std::endl;
    outFile << "After swap: x = " << x << ", y = " << y << std::endl;

    outFile.close();
    std::cout << "Results written to " << filename << std::endl;

    return 0;
}