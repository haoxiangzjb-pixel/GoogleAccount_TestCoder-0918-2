      SUBROUTINE DOT_PRODUCT_SUB(A, B, N, RESULT)
      IMPLICIT NONE
      INTEGER, INTENT(IN) :: N
      REAL, INTENT(IN) :: A(N), B(N)
      REAL, INTENT(OUT) :: RESULT
      INTEGER :: I

      RESULT = 0.0
      DO I = 1, N
         RESULT = RESULT + A(I) * B(I)
      END DO

      RETURN
      END