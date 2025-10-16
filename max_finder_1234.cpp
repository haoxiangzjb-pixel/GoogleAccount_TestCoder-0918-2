#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>
#include <fstream>

int main() {
    // Пример массива целых чисел
    std::vector<int> array = {3, 7, 2, 9, 1, 5, 6};

    // Найти максимальное число в массиве
    int max_value = *std::max_element(array.begin(), array.end());

    std::cout << "Максимальное число в массиве: " << max_value << std::endl;

    // Генерация случайного имени файла
    std::srand(std::time(0));
    int random_num = std::rand() % 10000; // Генерируем случайное число от 0 до 9999
    std::string filename = "result_" + std::to_string(random_num) + ".txt";

    // Сохранение результата в файл со случайным именем
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное число в массиве: " << max_value << std::endl;
        file.close();
        std::cout << "Результат сохранен в файл: " << filename << std::endl;
    } else {
        std::cerr << "Не удалось открыть файл для записи: " << filename << std::endl;
    }

    return 0;
}