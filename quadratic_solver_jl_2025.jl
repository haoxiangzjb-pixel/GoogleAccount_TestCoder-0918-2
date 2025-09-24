# Function to solve a quadratic equation ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Calculate the discriminant
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
        imag_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imag_part)
        root2 = complex(real_part, -imag_part)
        return (root1, root2)
    end
end

# Example usage:
# result = solve_quadratic(1, -3, 2) # Roots for x^2 - 3x + 2 = 0
# println(result) # Should print (2.0, 1.0)