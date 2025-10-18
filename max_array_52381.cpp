#include <iostream>
#include <vector>
#include <algorithm>
#include <ctime>
#include <cstdlib>

int main() {
    // Initialize random seed
    std::srand(std::time(0));

    // Create a random size for the array (between 5 and 20)
    int size = std::rand() % 16 + 5;

    // Create a vector with random integers (between 1 and 100)
    std::vector<int> arr(size);
    for (int i = 0; i < size; ++i) {
        arr[i] = std::rand() % 100 + 1;
    }

    // Print the array
    std::cout << "Array: ";
    for (int i = 0; i < size; ++i) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;

    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());

    std::cout << "Maximum element: " << max_element << std::endl;

    return 0;
}