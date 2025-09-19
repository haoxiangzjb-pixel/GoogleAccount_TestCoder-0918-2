import numpy as np

# Create two matrices
A = np.array([[1, 2, 3],
              [4, 5, 6]])

B = np.array([[7, 8],
              [9, 10],
              [11, 12]])

# Perform matrix multiplication using @ operator (Python 3.5+)
C = A @ B

print("Matrix A:")
print(A)
print("\nMatrix B:")
print(B)
print("\nResult of A @ B:")
print(C)

# Another example with random matrices
print("\n" + "="*30)
print("Random matrices example:")

# Create random matrices
np.random.seed(42)  # For reproducible results
X = np.random.rand(4, 3)
Y = np.random.rand(3, 2)

# Perform matrix multiplication using np.matmul
Z = np.matmul(X, Y)

print("\nMatrix X (4×3):")
print(X)
print("\nMatrix Y (3×2):")
print(Y)
print("\nResult Z = X × Y (4×2):")
print(Z)