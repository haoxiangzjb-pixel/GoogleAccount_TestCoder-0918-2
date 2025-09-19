import numpy as np

def matrix_multiplication_example():
    # Create two random matrices
    matrix_a = np.random.rand(3, 3)
    matrix_b = np.random.rand(3, 3)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    # Print the matrices and result
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    print("\nResult of A × B:")
    print(result)
    
    # Additional example with specific matrices
    print("\n" + "="*40)
    print("Additional Example:")
    # Define specific matrices
    A = np.array([[1, 2, 3],
                  [4, 5, 6]])
    
    B = np.array([[7, 8],
                  [9, 10],
                  [11, 12]])
    
    # Multiply them
    C = np.dot(A, B)
    print("Matrix A (2×3):")
    print(A)
    print("\nMatrix B (3×2):")
    print(B)
    print("\nResult C = A × B (2×2):")
    print(C)

if __name__ == "__main__":
    matrix_multiplication_example()