"""
Function to solve quadratic equations of the form ax^2 + bx + c = 0
Returns the roots of the quadratic equation
"""
function solve_quadratic(a, b, c)
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return (root1, root2)
    elseif discriminant == 0
        # One real root
        root = -b / (2*a)
        return (root,)
    else
        # Complex roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return (root1, root2)
    end
end

# Example usage:
# println(solve_quadratic(1, -5, 6))  # Should output (3.0, 2.0)
# println(solve_quadratic(1, 0, 1))   # Should output (0.0 + 1.0im, 0.0 - 1.0im)
# println(solve_quadratic(1, -2, 1))  # Should output (1.0,)