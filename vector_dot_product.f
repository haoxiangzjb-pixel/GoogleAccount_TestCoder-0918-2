program dot_product_test
    implicit none
    integer, parameter :: n = 3
    real, dimension(n) :: a = [1.0, 2.0, 3.0]
    real, dimension(n) :: b = [4.0, 5.0, 6.0]
    real :: result

    call vector_dot_product(a, b, n, result)
    print *, 'Dot product is: ', result

end program dot_product_test

subroutine vector_dot_product(vec1, vec2, size, dot_product_result)
    implicit none
    integer, intent(in) :: size
    real, dimension(size), intent(in) :: vec1, vec2
    real, intent(out) :: dot_product_result
    integer :: i

    dot_product_result = 0.0
    do i = 1, size
        dot_product_result = dot_product_result + vec1(i) * vec2(i)
    end do

end subroutine vector_dot_product