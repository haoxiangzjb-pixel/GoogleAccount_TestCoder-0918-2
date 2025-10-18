C     Fortran subprogram to calculate vector dot product
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
C
C     Calculate the dot product of two vectors A and B of size N
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
C
C     Example program to demonstrate the subroutine
      PROGRAM TEST_DOT_PRODUCT
      INTEGER N
      PARAMETER (N = 5)
      REAL A(N), B(N), RESULT
      INTEGER I
C
C     Initialize vectors A and B
      DO I = 1, N
        A(I) = REAL(I)
        B(I) = REAL(I * 2)
      END DO
C
      CALL DOT_PRODUCT_VEC(N, A, B, RESULT)
C
      PRINT *, 'Vector A: '
      DO I = 1, N
        PRINT *, A(I)
      END DO
C
      PRINT *, 'Vector B: '
      DO I = 1, N
        PRINT *, B(I)
      END DO
C
      PRINT *, 'Dot product result: ', RESULT
C
      STOP
      END