C This file contains a Fortran subprogram to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
C
C     Calculates the dot product of two N-dimensional vectors A and B.
C
C     Parameters:
C     N      - (INPUT) INTEGER: The number of elements in the vectors.
C     A      - (INPUT) REAL array of dimension N: The first vector.
C     B      - (INPUT) REAL array of dimension N: The second vector.
C     RESULT - (OUTPUT) REAL: The resulting dot product.
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I

      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO

      RETURN
      END