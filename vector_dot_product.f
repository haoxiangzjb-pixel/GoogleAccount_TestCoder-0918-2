C This Fortran 77 subroutine calculates the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      RESULT = 0.0
      DO 10 I = 1, N
         RESULT = RESULT + A(I) * B(I)
   10 CONTINUE
      RETURN
      END