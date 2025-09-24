C     Subroutine to calculate the dot product of two vectors
      subroutine dot_product_vec(n, a, b, result)
      implicit none
      integer n, i
      real a(n), b(n), result

      result = 0.0
      do i = 1, n
         result = result + a(i) * b(i)
      end do
      return
      end