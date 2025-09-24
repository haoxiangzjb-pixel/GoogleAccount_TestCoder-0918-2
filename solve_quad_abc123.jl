function solve_quadratic(a, b, c)
    """
    Решает квадратное уравнение вида ax^2 + bx + c = 0.
    Возвращает кортеж (x1, x2) или (NaN, NaN) в случае ошибки.
    """
    if a == 0
        error("Коэффициент a не может быть равен нулю для квадратного уравнения.")
    end
    discriminant = b^2 - 4*a*c
    sqrt_discriminant = sqrt(complex(discriminant))
    x1 = (-b + sqrt_discriminant) / (2*a)
    x2 = (-b - sqrt_discriminant) / (2*a)
    return (x1, x2)
end