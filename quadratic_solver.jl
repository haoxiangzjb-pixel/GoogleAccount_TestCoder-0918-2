# Function to solve quadratic equations of the form ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Calculate the discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution
        x = -b / (2*a)
        return (x,)
    else
        # Two complex solutions
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        x1 = complex(real_part, imaginary_part)
        x2 = complex(real_part, -imaginary_part)
        return (x1, x2)
    end
end

# Example usage
println("Example: Solving x^2 - 5x + 6 = 0")
solutions = solve_quadratic(1, -5, 6)
println("Solutions: ", solutions)

println("\nExample: Solving x^2 - 2x + 1 = 0")
solutions = solve_quadratic(1, -2, 1)
println("Solutions: ", solutions)

println("\nExample: Solving x^2 + 1 = 0")
solutions = solve_quadratic(1, 0, 1)
println("Solutions: ", solutions)