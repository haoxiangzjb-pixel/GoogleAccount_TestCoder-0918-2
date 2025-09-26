function solve_quadratic(a, b, c)
    # Рассчитываем дискриминант
    discriminant = b^2 - 4*a*c

    if discriminant > 0
        # Два различных вещественных корня
        sqrt_discriminant = sqrt(discriminant)
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один вещественный корень (кратность 2)
        x = -b / (2*a)
        return (x, x)
    else
        # Комплексные корни
        sqrt_discriminant = sqrt(complex(discriminant))
        x1 = (-b + sqrt_discriminant) / (2*a)
        x2 = (-b - sqrt_discriminant) / (2*a)
        return (x1, x2)
    end
end

# Примеры использования:
# println(solve_quadratic(1, -5, 6))  # (3.0, 2.0)
# println(solve_quadratic(1, -2, 1))  # (1.0, 1.0)
# println(solve_quadratic(1, 0, 1))   # (0.0 + 1.0im, 0.0 - 1.0im)
