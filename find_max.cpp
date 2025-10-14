#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <cstdlib>
#include <ctime>

int main() {
    // Initialize random seed
    std::srand(std::time(0));

    // Example array, you can change this
    std::vector<int> array = {3, 7, 2, 9, 1};

    // Find the maximum element
    int max_element = *std::max_element(array.begin(), array.end());

    // Generate a random filename
    std::string filename = "max_result_" + std::to_string(std::rand()) + ".txt";

    // Open the file for writing
    FILE* file = fopen(filename.c_str(), "w");
    if (file == nullptr) {
        std::cerr << "Error opening file!" << std::endl;
        return 1;
    }

    // Write the maximum element to the file
    fprintf(file, "%d\n", max_element);

    // Close the file
    fclose(file);

    std::cout << "Maximum element " << max_element << " written to " << filename << std::endl;

    return 0;
}