#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string filename = "max_array_";
    
    // Use time as seed for random number generation
    std::srand(static_cast<unsigned>(std::time(0)));
    
    // Generate 8 random characters
    for (int i = 0; i < 8; ++i) {
        filename += charset[std::rand() % charset.length()];
    }
    
    filename += ".txt";
    return filename;
}

int findMax(const std::vector<int>& arr) {
    if (arr.empty()) {
        std::cerr << "Array is empty!" << std::endl;
        return 0; // or throw an exception
    }
    
    int maxVal = arr[0];
    for (size_t i = 1; i < arr.size(); ++i) {
        if (arr[i] > maxVal) {
            maxVal = arr[i];
        }
    }
    
    return maxVal;
}

int main() {
    // Example array
    std::vector<int> numbers = {3, 7, 2, 9, 1, 8, 5, 6, 4};
    
    std::cout << "Array elements: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    
    int maxNumber = findMax(numbers);
    std::cout << "Maximum number in the array: " << maxNumber << std::endl;
    
    // Generate random filename
    std::string filename = generateRandomFilename();
    std::cout << "Saving result to file: " << filename << std::endl;
    
    // Save the result to the file with random name
    FILE* file = fopen(filename.c_str(), "w");
    if (file != nullptr) {
        fprintf(file, "Array elements: ");
        for (int num : numbers) {
            fprintf(file, "%d ", num);
        }
        fprintf(file, "\nMaximum number in the array: %d\n", maxNumber);
        fclose(file);
        std::cout << "Result successfully saved to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
    
    return 0;
}