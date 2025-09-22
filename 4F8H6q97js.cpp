#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Create a vector with some sample data
    std::vector<int> numbers = {3, 5, 7, 2, 8, 1, 9, 4, 6};
    
    // Find maximum using std::max_element
    auto maxElement = std::max_element(numbers.begin(), numbers.end());
    
    // Print the result
    if (maxElement != numbers.end()) {
        std::cout << "Maximum number in the array is: " << *maxElement << std::endl;
    } else {
        std::cout << "Array is empty" << std::endl;
    }
    
    return 0;
}