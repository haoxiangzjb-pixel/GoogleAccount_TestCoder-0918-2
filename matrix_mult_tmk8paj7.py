#!/usr/bin/env python3
"""
NumPy Matrix Multiplication Script
This script demonstrates matrix multiplication using NumPy.
"""

import numpy as np

def main():
    print("NumPy Matrix Multiplication Example")
    print("=" * 40)
    
    # Create two random matrices
    matrix_a = np.array([[1, 2, 3],
                         [4, 5, 6]])
    
    matrix_b = np.array([[7, 8],
                         [9, 10],
                         [11, 12]])
    
    print("Matrix A (2x3):")
    print(matrix_a)
    print("\nMatrix B (3x2):")
    print(matrix_b)
    
    # Perform matrix multiplication using @ operator
    result = matrix_a @ matrix_b
    print("\nResult of A @ B (2x2):")
    print(result)
    
    # Alternative method using np.dot()
    result_dot = np.dot(matrix_a, matrix_b)
    print("\nResult using np.dot() (should be the same):")
    print(result_dot)
    
    # Verify both methods produce the same result
    print(f"\nBoth methods produce same result: {np.array_equal(result, result_dot)}")
    
    # Create larger random matrices for demonstration
    print("\n" + "=" * 40)
    print("Random 4x4 matrices multiplication:")
    
    rand_matrix_1 = np.random.randint(1, 10, size=(4, 4))
    rand_matrix_2 = np.random.randint(1, 10, size=(4, 4))
    
    print("Random Matrix 1:")
    print(rand_matrix_1)
    print("\nRandom Matrix 2:")
    print(rand_matrix_2)
    
    result_random = np.matmul(rand_matrix_1, rand_matrix_2)
    print("\nResult of random matrices multiplication:")
    print(result_random)

if __name__ == "__main__":
    main()