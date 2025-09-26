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
    // 示例：交换两个整数
    int x = 10;
    int y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string s1 = "Hello";
    std::string s2 = "World";
    std::cout << "交换前: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    mySwap(s1, s2);
    std::cout << "交换后: s1 = " << s1 << ", s2 = " << s2 << std::endl;

    // 生成随机文件名
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    std::string filename = "swap_output_" + std::to_string(dis(gen)) + ".txt";

    // 将交换后的结果写入随机命名的文件
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << "交换后的值:\n";
        outFile << "x = " << x << "\n";
        outFile << "y = " << y << "\n";
        outFile << "s1 = " << s1 << "\n";
        outFile << "s2 = " << s2 << "\n";
        outFile.close();
        std::cout << "结果已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
        return 1;
    }

    return 0;
}