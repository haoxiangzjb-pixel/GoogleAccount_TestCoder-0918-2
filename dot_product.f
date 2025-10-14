C This file contains a Fortran subprogram to calculate the dot product of two vectors.
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
C
C     N      : INTEGER, number of elements in the vectors
C     A, B   : REAL arrays of size N, the input vectors
C     RESULT : REAL, the output dot product
C
      INTEGER N
      REAL A(N), B(N), RESULT
C
      INTEGER I
      RESULT = 0.0
      DO I = 1, N
          RESULT = RESULT + A(I) * B(I)
      END DO
      RETURN
      END