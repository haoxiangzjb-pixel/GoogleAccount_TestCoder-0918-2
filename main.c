#include <stdio.h>

// Declare the assembly function
extern long add_numbers(long a, long b);

int main() {
    long num1 = 15;
    long num2 = 25;
    long result = add_numbers(num1, num2);
    
    printf("Adding %ld and %ld gives: %ld\n", num1, num2, result);
    
    // Test with other values
    num1 = -10;
    num2 = 30;
    result = add_numbers(num1, num2);
    
    printf("Adding %ld and %ld gives: %ld\n", num1, num2, result);
    
    return 0;
}