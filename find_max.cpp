#include <iostream>
#include <vector>
#include <algorithm> // for std::max_element
#include <random>    // for generating a random array
#include <ctime>     // for seeding the random number generator

int main() {
    // Seed the random number generator
    std::srand(static_cast<unsigned int>(std::time(0)));

    // Define the size of the array
    const int size = 10;

    // Create a vector to hold the array elements
    std::vector<int> arr(size);

    // Fill the array with random numbers (for demonstration)
    std::cout << "Generated array: ";
    for (int i = 0; i < size; ++i) {
        arr[i] = std::rand() % 100; // Random number between 0 and 99
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;

    // Find the maximum element using std::max_element
    auto max_element_it = std::max_element(arr.begin(), arr.end());

    // Print the maximum element
    if (max_element_it != arr.end()) {
        int max_value = *max_element_it;
        std::cout << "Maximum value in the array: " << max_value << std::endl;
    } else {
        std::cout << "Array is empty." << std::endl;
    }

    return 0;
}