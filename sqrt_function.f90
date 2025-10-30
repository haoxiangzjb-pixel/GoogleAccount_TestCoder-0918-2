! Fortran function to calculate the square root
real function my_sqrt(x)
    implicit none
    real, intent(in) :: x
    
    ! All variable declarations must come before executable statements
    real :: guess, new_guess
    integer :: iterations
    
    ! Check if input is negative
    if (x < 0.0) then
        print *, 'Error: Cannot calculate square root of negative number'
        my_sqrt = -1.0  ! Return error value
        return
    end if
    
    ! Calculate square root using Newton's method
    if (x == 0.0) then
        my_sqrt = 0.0
        return
    end if
    
    ! Initial guess
    guess = x / 2.0
    
    ! Newton's method iterations
    do iterations = 1, 20
        new_guess = 0.5 * (guess + x / guess)
        
        ! Check for convergence
        if (abs(new_guess - guess) < 1.0e-10) then
            exit
        end if
        
        guess = new_guess
    end do
    
    my_sqrt = new_guess
end function my_sqrt

! Example program to test the function
program test_sqrt
    implicit none
    real :: input_val, result
    real, external :: my_sqrt
    
    ! Test with a few values
    input_val = 25.0
    result = my_sqrt(input_val)
    print *, 'Square root of', input_val, 'is', result
    
    input_val = 16.0
    result = my_sqrt(input_val)
    print *, 'Square root of', input_val, 'is', result
    
    input_val = 2.0
    result = my_sqrt(input_val)
    print *, 'Square root of', input_val, 'is', result
end program test_sqrt