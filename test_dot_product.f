C     Test program for the dot product subroutine
      PROGRAM TEST_DOT_PRODUCT
      INTEGER N
      PARAMETER (N = 3)
      REAL VEC1(N), VEC2(N), RESULT
      
C     Initialize test vectors
      VEC1(1) = 1.0
      VEC1(2) = 2.0
      VEC1(3) = 3.0
      
      VEC2(1) = 4.0
      VEC2(2) = 5.0
      VEC2(3) = 6.0
      
C     Call the dot product subroutine
      CALL DOT_PRODUCT_CALC(VEC1, VEC2, N, RESULT)
      
C     Print the result
      PRINT *, 'Dot product result: ', RESULT
      
      STOP
      END
      
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