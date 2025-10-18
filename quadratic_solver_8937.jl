# Julia function to solve quadratic equations
# Solves equations of the form ax^2 + bx + c = 0

function solve_quadratic(a, b, c)
    """
    Solves a quadratic equation ax^2 + bx + c = 0
    Returns a tuple of the solutions (x1, x2) or appropriate message for special cases
    """
    
    # Check if it's actually a quadratic equation
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0 = 0)"
            else
                return "No solution (contradiction)"
            end
        else
            # Linear equation: bx + c = 0
            x = -c / b
            return (x, x)  # Return same value twice to maintain tuple format
        end
    end
    
    # Calculate discriminant
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Two real solutions
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # One real solution (repeated root)
        x = -b / (2*a)
        return (x, x)
    else
        # Complex solutions
        sqrt_discriminant = sqrt(Complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Example usage:
println("Example: solving x^2 - 5x + 6 = 0")
a, b, c = 1, -5, 6
solutions = solve_quadratic(a, b, c)
println("Solutions: ", solutions)

println("\nExample: solving x^2 + 2x + 5 = 0 (complex solutions)")
a, b, c = 1, 2, 5
solutions = solve_quadratic(a, b, c)
println("Solutions: ", solutions)

println("\nExample: solving 2x^2 - 4x + 2 = 0 (repeated root)")
a, b, c = 2, -4, 2
solutions = solve_quadratic(a, b, c)
println("Solutions: ", solutions)