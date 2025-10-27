#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFileName() {
    const std::string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string fileName = "max_result_";
    
    // Seed the random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, characters.size() - 1);
    
    // Generate 8 random characters for the filename
    for (int i = 0; i < 8; i++) {
        fileName += characters[dis(gen)];
    }
    
    fileName += ".txt";
    return fileName;
}

int main() {
    // Define an array of integers
    std::vector<int> arr = {12, 45, 23, 67, 34, 89, 56, 78, 90, 11};
    
    // Print the array
    std::cout << "Array elements: ";
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    
    // Find the maximum element
    int maxElement = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Maximum element in the array: " << maxElement << std::endl;
    
    // Generate a random filename
    std::string fileName = generateRandomFileName();
    
    // Write the maximum element to the file
    std::ofstream outFile(fileName);
    if (outFile.is_open()) {
        outFile << maxElement;
        outFile.close();
        std::cout << "Maximum element saved to file: " << fileName << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << fileName << " for writing." << std::endl;
        return 1;
    }
    
    return 0;
}