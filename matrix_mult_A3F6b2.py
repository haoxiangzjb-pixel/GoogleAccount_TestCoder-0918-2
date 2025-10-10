import numpy as np

def main():
    # Define two matrices
    A = np.array([[1, 2, 3],
                  [4, 5, 6]])

    B = np.array([[7, 8],
                  [9, 10],
                  [11, 12]])

    # Perform matrix multiplication using @ operator
    C = A @ B
    print("Matrix A:")
    print(A)
    print("\nMatrix B:")
    print(B)
    print("\nResult of A @ B:")
    print(C)

    # Perform matrix multiplication using np.dot (alternative method)
    D = np.dot(A, B)
    print("\nResult of np.dot(A, B):")
    print(D)

    # Verify results are the same
    print(f"\nResults are the same: {np.array_equal(C, D)}")

if __name__ == "__main__":
    main()