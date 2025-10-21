#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string fileName = "result_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; i++) {
        fileName += charset[dis(gen)];
    }
    
    fileName += ".txt";
    return fileName;
}

int findMaxInArray(const std::vector<int>& arr) {
    if (arr.empty()) {
        throw std::runtime_error("Array is empty");
    }
    
    int maxVal = arr[0];
    for (int num : arr) {
        if (num > maxVal) {
            maxVal = num;
        }
    }
    
    return maxVal;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> numbers = {3, 7, 2, 9, 1, 5, 8, 4, 6, 10, -2, 15, 12};
    
    try {
        int maxNumber = findMaxInArray(numbers);
        
        std::string fileName = generateRandomFileName();
        
        std::ofstream outFile(fileName);
        if (!outFile.is_open()) {
            std::cerr << "Error: Could not open file for writing." << std::endl;
            return 1;
        }
        
        outFile << "Maximum number in the array: " << maxNumber << std::endl;
        outFile << "Array elements: ";
        for (size_t i = 0; i < numbers.size(); i++) {
            outFile << numbers[i];
            if (i < numbers.size() - 1) {
                outFile << ", ";
            }
        }
        outFile << std::endl;
        
        outFile.close();
        
        std::cout << "Maximum number " << maxNumber << " has been saved to file: " << fileName << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}