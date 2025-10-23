#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// Template function to swap two variables
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// Function to generate a random filename
std::string generateRandomFilename() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 9);
    
    std::string filename = "swap_";
    for (int i = 0; i < 8; ++i) {
        filename += std::to_string(dis(gen));
    }
    filename += ".cpp";
    
    return filename;
}

int main() {
    // Example usage of the swap function
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    // Generate random filename
    std::string randomFilename = generateRandomFilename();
    
    // Write the template function to the randomly named file
    std::ofstream file(randomFilename);
    file << "#include <iostream>\n\n";
    file << "// Template function to swap two variables\n";
    file << "template<typename T>\n";
    file << "void swap(T& a, T& b) {\n";
    file << "    T temp = a;\n";
    file << "    a = b;\n";
    file << "    b = temp;\n";
    file << "}\n\n";
    file << "// Example usage\n";
    file << "int main() {\n";
    file << "    int x = 5, y = 10;\n";
    file << "    std::cout << \"Before swap: x = \" << x << \", y = \" << y << std::endl;\n";
    file << "    swap(x, y);\n";
    file << "    std::cout << \"After swap: x = \" << x << \", y = \" << y << std::endl;\n";
    file << "    return 0;\n";
    file << "}\n";
    file.close();
    
    std::cout << "Template function saved to: " << randomFilename << std::endl;
    
    return 0;
}