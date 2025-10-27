#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <random>

int main() {
    // Пример массива
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8, 6, 4};
    
    // Находим максимальное значение
    int max_value = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Максимальное значение в массиве: " << max_value << std::endl;
    
    // Генерируем случайное имя файла
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    
    int random_num = dis(gen);
    std::string filename = "result_" + std::to_string(random_num) + ".txt";
    
    // Сохраняем результат в файл
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное значение в массиве: " << max_value << std::endl;
        file.close();
        std::cout << "Результат сохранен в файл: " << filename << std::endl;
    } else {
        std::cerr << "Не удалось создать файл!" << std::endl;
        return 1;
    }
    
    return 0;
}