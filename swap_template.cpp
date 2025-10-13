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

// 生成随机文件名
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 1000000);

    int random_number = dis(gen);
    return "random_file_" + std::to_string(random_number) + extension;
}

int main() {
    // 示例：交换两个整数
    int x = 10;
    int y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // 将结果保存到随机命名的文件中
    std::string filename = generateRandomFilename(".cpp");
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << "// This file was generated with a random name.\n";
        outFile << "// It contains the definition of a template swap function.\n\n";
        outFile << "template<typename T>\n";
        outFile << "void mySwap(T& a, T& b) {\n";
        outFile << "    T temp = a;\n";
        outFile << "    a = b;\n";
        outFile << "    b = temp;\n";
        outFile << "}\n";
        outFile.close();
        std::cout << "模板函数已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
    }

    return 0;
}