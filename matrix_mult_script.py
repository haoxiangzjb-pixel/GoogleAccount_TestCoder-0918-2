import numpy as np

def main():
    # Define two random matrices
    A = np.random.rand(3, 4)
    B = np.random.rand(4, 2)

    print("Matrix A (3x4):")
    print(A)
    print("\nMatrix B (4x2):")
    print(B)

    # Perform matrix multiplication
    C = np.dot(A, B)
    # Alternatively, you can use the @ operator: C = A @ B

    print("\nResult of A * B (3x2):")
    print(C)

if __name__ == "__main__":
    main()