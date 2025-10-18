#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <fstream>

int main() {
    // Пример массива
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8};
    
    // Находим максимальное число
    int max_num = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Максимальное число в массиве: " << max_num << std::endl;
    
    // Генерируем случайное имя файла
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    int random_num = dis(gen);
    std::string filename = "random_" + std::to_string(random_num) + ".txt";
    
    // Записываем результат в файл
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное число в массиве: " << max_num << std::endl;
        file.close();
        std::cout << "Результат сохранен в файл: " << filename << std::endl;
    } else {
        std::cout << "Не удалось создать файл." << std::endl;
    }
    
    return 0;
}