#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <ctime>
#include <cstdlib>

int main() {
    // Пример массива
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Найти максимальное число
    int max_val = *std::max_element(arr.begin(), arr.end());

    // Сгенерировать случайное имя файла
    std::srand(std::time(0));
    int random_num = std::rand() % 10000; // Случайное число от 0 до 9999
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";

    // Сохранить результат в файл
    std::ofstream file(filename);
    if (file.is_open()) {
        file << max_val << std::endl;
        file.close();
        std::cout << "Максимальное число " << max_val << " сохранено в файл " << filename << std::endl;
    } else {
        std::cerr << "Не удалось создать файл " << filename << std::endl;
        return 1;
    }

    return 0;
}