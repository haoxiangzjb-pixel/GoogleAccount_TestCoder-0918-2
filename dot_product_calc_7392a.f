C     Subroutine to calculate the dot product of two vectors
      SUBROUTINE DOT_PRODUCT_CALC(VEC1, VEC2, N, RESULT)
      INTEGER N
      REAL VEC1(N), VEC2(N), RESULT
      INTEGER I
      
      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + VEC1(I) * VEC2(I)
      END DO
      
      RETURN
      END