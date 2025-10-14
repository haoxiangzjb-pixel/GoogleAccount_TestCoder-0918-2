#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <random>

int main() {
    // Example array
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Find the maximum element
    int max_val = *std::max_element(arr.begin(), arr.end());

    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    std::string filename = "/workspace/max_result_" + std::to_string(dis(gen)) + ".txt";

    // Write the result to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum value in the array: " << max_val << std::endl;
        file.close();
        std::cout << "Maximum value found: " << max_val << std::endl;
        std::cout << "Result saved to: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file for writing." << std::endl;
        return 1;
    }

    return 0;
}