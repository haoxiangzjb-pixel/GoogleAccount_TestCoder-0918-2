#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string result = "output_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; ++i) {
        result += charset[dis(gen)];
    }
    
    result += ".txt";  // Add file extension
    return result;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 5, 6, 4};
    
    // Print the array
    std::cout << "Array elements: ";
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    
    // Find the maximum element
    int maxElement = *std::max_element(arr.begin(), arr.end());
    std::cout << "Maximum element: " << maxElement << std::endl;
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    std::cout << "Saving result to file: " << filename << std::endl;
    
    // Write the maximum element to the file
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << maxElement;
        outFile.close();
        std::cout << "Result successfully saved to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
        return 1;
    }
    
    return 0;
}