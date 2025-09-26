C This file contains a Fortran subprogram to calculate the dot product of two vectors.
      SUBROUTINE DOT_PRODUCT_VEC(A, B, N, RESULT)
C
C     A: First input vector (REAL array)
C     B: Second input vector (REAL array)
C     N: Number of elements in the vectors (INTEGER)
C     RESULT: The calculated dot product (REAL)
C
      REAL A(N), B(N), RESULT
      INTEGER N
      INTEGER I
C
      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      ENDDO
C
      RETURN
      END