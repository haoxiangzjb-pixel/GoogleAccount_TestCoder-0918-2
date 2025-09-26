function solve_quadratic(a, b, c)
    discriminant = b^2 - 4a*c
    if discriminant > 0
        sqrt_disc = sqrt(discriminant)
        x1 = (-b + sqrt_disc) / (2a)
        x2 = (-b - sqrt_disc) / (2a)
        return (x1, x2)
    elseif discriminant == 0
        x = -b / (2a)
        return (x, x)
    else
        sqrt_disc = sqrt(Complex(discriminant))
        x1 = (-b + sqrt_disc) / (2a)
        x2 = (-b - sqrt_disc) / (2a)
        return (x1, x2)
    end
end

# Примеры использования
println(solve_quadratic(1, -5, 6))  # (3.0, 2.0)
println(solve_quadratic(1, -2, 1))  # (1.0, 1.0)
println(solve_quadratic(1, 0, 1))   # (0.0 + 1.0im, 0.0 - 1.0im)