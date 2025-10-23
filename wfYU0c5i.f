C     Fortran 77 子程序计算向量点积
      SUBROUTINE DOT_PRODUCT_VEC(N, A, B, RESULT)
      INTEGER N
      REAL A(N), B(N), RESULT
      INTEGER I
      
      RESULT = 0.0
      DO I = 1, N
        RESULT = RESULT + A(I) * B(I)
      END DO
      
      RETURN
      END
      
C     示例程序演示如何使用子程序
      PROGRAM EXAMPLE
      INTEGER N
      PARAMETER (N = 5)
      REAL VEC1(N), VEC2(N), DOT_RES
      INTEGER I
      
C     初始化向量
      DO I = 1, N
        VEC1(I) = REAL(I)
        VEC2(I) = REAL(I * 2)
      END DO
      
C     调用点积子程序
      CALL DOT_PRODUCT_VEC(N, VEC1, VEC2, DOT_RES)
      
C     输出结果
      PRINT *, 'Vector 1: '
      DO I = 1, N
        PRINT *, VEC1(I)
      END DO
      
      PRINT *, 'Vector 2: '
      DO I = 1, N
        PRINT *, VEC2(I)
      END DO
      
      PRINT *, 'Dot Product Result: ', DOT_RES
      
      STOP
      END