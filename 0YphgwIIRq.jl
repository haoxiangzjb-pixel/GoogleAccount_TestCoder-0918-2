function solve_quadratic(a, b, c)
    # Handle the case where a is zero (linear equation)
    if a == 0
        if b == 0
            if c == 0
                return "Infinite solutions (0 = 0)"
            else
                return "No solution"
            end
        else
            # bx + c = 0  =>  x = -c/b
            return [-c/b]
        end
    end

    # Calculate the discriminant
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Two distinct real roots
        root1 = (-b + sqrt(discriminant)) / (2*a)
        root2 = (-b - sqrt(discriminant)) / (2*a)
        return [root1, root2]
    elseif discriminant == 0
        # One repeated real root
        root = -b / (2*a)
        return [root]
    else
        # Two complex conjugate roots
        real_part = -b / (2*a)
        imaginary_part = sqrt(-discriminant) / (2*a)
        root1 = complex(real_part, imaginary_part)
        root2 = complex(real_part, -imaginary_part)
        return [root1, root2]
    end
end

# Example usage:
# println(solve_quadratic(1, -3, 2))  # Should print [2.0, 1.0]
# println(solve_quadratic(1, -2, 1))  # Should print [1.0]
# println(solve_quadratic(1, 0, 1))   # Should print [0.0+1.0im, 0.0-1.0im]
# println(solve_quadratic(0, 2, -4))  # Should print [2.0]