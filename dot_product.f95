! Fortran 95 subroutine to calculate the dot product of two vectors
!
! Input:
!   a, b: Real arrays representing the two vectors
!   n: Integer, the number of elements in the vectors
! Output:
!   result: Real, the calculated dot product

subroutine calculate_dot_product(a, b, n, result)
    implicit none

    ! Argument declarations
    integer, intent(in) :: n
    real, intent(in) :: a(n), b(n)
    real, intent(out) :: result

    ! Local variables
    integer :: i

    ! Initialize the result to zero
    result = 0.0

    ! Calculate the dot product: sum of a(i) * b(i)
    do i = 1, n
        result = result + a(i) * b(i)
    end do

end subroutine calculate_dot_product