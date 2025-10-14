C This file contains a Fortran subprogram to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Input:
C     N      - The number of elements in the vectors (integer)
C     A      - The first vector (real array of size N)
C     B      - The second vector (real array of size N)
C
C     Output:
C     RESULT - The dot product of A and B (real)
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