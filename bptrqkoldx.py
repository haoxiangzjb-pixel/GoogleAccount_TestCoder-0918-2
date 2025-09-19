import numpy as np

def matrix_multiply_demo():
    # Create two random matrices
    matrix_a = np.random.rand(3, 3)
    matrix_b = np.random.rand(3, 3)
    
    # Perform matrix multiplication using np.dot()
    result_dot = np.dot(matrix_a, matrix_b)
    
    # Perform matrix multiplication using @ operator (Python 3.5+)
    result_at = matrix_a @ matrix_b
    
    # Perform element-wise multiplication for comparison
    result_elementwise = matrix_a * matrix_b
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    print("\nMatrix multiplication using np.dot():")
    print(result_dot)
    print("\nMatrix multiplication using @ operator:")
    print(result_at)
    print("\nElement-wise multiplication (for comparison):")
    print(result_elementwise)
    
    # Verify that both multiplication methods give the same result
    print("\nAre dot and @ results equal?", np.allclose(result_dot, result_at))

if __name__ == "__main__":
    matrix_multiply_demo()