#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

int main() {
    // Пример массива
    std::vector<int> numbers = {3, 7, 2, 9, 1};

    // Найти максимальный элемент
    auto max_element_it = std::max_element(numbers.begin(), numbers.end());

    if (max_element_it != numbers.end()) {
        int max_value = *max_element_it;
        std::cout << "Максимальное число в массиве: " << max_value << std::endl;

        // Сохранить результат в файл
        std::ofstream outfile("max_result.txt");
        if (outfile.is_open()) {
            outfile << max_value;
            outfile.close();
            std::cout << "Результат также сохранен в файл 'max_result.txt'." << std::endl;
        } else {
            std::cerr << "Не удалось открыть файл для записи." << std::endl;
        }
    } else {
        std::cout << "Массив пуст." << std::endl;
    }

    return 0;
}