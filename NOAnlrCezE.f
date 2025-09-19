      PROGRAM test_dot_product
      IMPLICIT NONE
      REAL, DIMENSION(3) :: a = (/1.0, 2.0, 3.0/)
      REAL, DIMENSION(3) :: b = (/4.0, 5.0, 6.0/)
      REAL :: result

      result = dot_product(a, b, 3)
      PRINT *, 'Dot product is: ', result
      END PROGRAM test_dot_product

      REAL FUNCTION dot_product(a, b, n)
      IMPLICIT NONE
      INTEGER, INTENT(IN) :: n
      REAL, INTENT(IN), DIMENSION(n) :: a, b
      REAL :: sum
      INTEGER :: i

      sum = 0.0
      DO i = 1, n
        sum = sum + a(i) * b(i)
      END DO
      dot_product = sum
      END FUNCTION dot_product