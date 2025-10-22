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
    
    // 将代码保存到随机命名的文件中
    std::string randomFileName = generateRandomFileName(".cpp");
    
    std::ofstream outFile(randomFileName);
    if (outFile.is_open()) {
        outFile << "#include <iostream>\n";
        outFile << "#include <fstream>\n";
        outFile << "#include <string>\n";
        outFile << "#include <random>\n";
        outFile << "#include <ctime>\n\n";
        
        outFile << "// C++模板函数：交换两个变量的值\n";
        outFile << "template<typename T>\n";
        outFile << "void swap(T& a, T& b) {\n";
        outFile << "    T temp = a;\n";
        outFile << "    a = b;\n";
        outFile << "    b = temp;\n";
        outFile << "}\n\n";
        
        outFile << "// 生成随机文件名的辅助函数\n";
        outFile << "std::string generateRandomFileName(const std::string& extension = \".cpp\") {\n";
        outFile << "    std::random_device rd;\n";
        outFile << "    std::mt19937 gen(rd());\n";
        outFile << "    std::uniform_int_distribution<> dis(0, 999999);\n";
        outFile << "    \n";
        outFile << "    std::time_t now = std::time(0);\n";
        outFile << "    std::string filename = \"swap_template_\" + std::to_string(now) + \"_\" + std::to_string(dis(gen)) + extension;\n";
        outFile << "    return filename;\n";
        outFile << "}\n\n";
        
        outFile << "int main() {\n";
        outFile << "    // 示例：交换不同类型的变量\n";
        outFile << "    int x = 10, y = 20;\n";
        outFile << "    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n";
        outFile << "    swap(x, y);\n";
        outFile << "    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n";
        outFile << "    \n";
        outFile << "    double a = 3.14, b = 2.71;\n";
        outFile << "    std::cout << \"交换前: a = \" << a << \", b = \" << b << std::endl;\n";
        outFile << "    swap(a, b);\n";
        outFile << "    std::cout << \"交换后: a = \" << a << \", b = \" << b << std::endl;\n";
        outFile << "    \n";
        outFile << "    std::string str1 = \"Hello\", str2 = \"World\";\n";
        outFile << "    std::cout << \"交换前: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n";
        outFile << "    swap(str1, str2);\n";
        outFile << "    std::cout << \"交换后: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n";
        outFile << "    \n";
        outFile << "    return 0;\n";
        outFile << "}\n";
        
        outFile.close();
        std::cout << "\n代码已保存到随机命名的文件: " << randomFileName << std::endl;
    } else {
        std::cerr << "无法创建文件: " << randomFileName << std::endl;
    }
    
    return 0;
}