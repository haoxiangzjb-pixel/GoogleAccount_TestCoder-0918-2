#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <cstdlib>
#include <ctime>

int main() {
    // Пример массива
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8};
    
    // Находим максимальное число в массиве
    int max_value = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Максимальное число в массиве: " << max_value << std::endl;
    
    // Генерируем случайное имя файла
    std::srand(std::time(0));
    int random_num = std::rand() % 10000;
    std::string filename = "result_" + std::to_string(random_num) + ".txt";
    
    // Сохраняем результат в файл
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное число в массиве: " << max_value << std::endl;
        file.close();
        std::cout << "Результат сохранен в файл: " << filename << std::endl;
    } else {
        std::cerr << "Не удалось создать файл для записи." << std::endl;
        return 1;
    }
    
    return 0;
}