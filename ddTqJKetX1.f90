program circle_area
    implicit none
    real :: radius, area, pi
    
    ! Define pi
    pi = 3.14159265359
    
    ! Get radius from user
    write(*,*) 'Enter the radius of the circle:'
    read(*,*) radius
    
    ! Calculate area
    area = pi * radius * radius
    
    ! Display the result
    write(*,*) 'The area of the circle with radius ', radius, ' is ', area
    
end program circle_area