C This file contains a Fortran subroutine to calculate the dot product of two vectors.

      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C
C     This subroutine calculates the dot product of two vectors A and B.
C
C     Parameters:
C     A - The first vector (input)
C     B - The second vector (input)
C     N - The number of elements in the vectors (input)
C     RESULT - The dot product (output)
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