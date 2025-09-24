C This file contains a Fortran subroutine to calculate the dot product of two vectors.
      SUBROUTINE DOT_PRODUCT(N, A, B, RESULT)
C
C     N: INTEGER, number of elements in the vectors
C     A: REAL array, first vector
C     B: REAL array, second vector
C     RESULT: REAL, the calculated dot product
C
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
C
      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO
C
      RETURN
      END