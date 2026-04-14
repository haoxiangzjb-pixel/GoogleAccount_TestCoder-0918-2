"""
Решение квадратного уравнения ax² + bx + c = 0

Возвращает кортеж с корнями уравнения:
- Два различных корня: (x1, x2)
- Один корень (кратность 2): (x, x)
- Нет действительных корней: (nothing, nothing)
"""
function solve_quadratic(a::Real, b::Real, c::Real)
    if a == 0
        error("Коэффициент 'a' не может быть равен нулю для квадратного уравнения")
    end
    
    discriminant = b^2 - 4*a*c
    
    if discriminant > 0
        # Два различных действительных корня
        x1 = (-b + sqrt(discriminant)) / (2*a)
        x2 = (-b - sqrt(discriminant)) / (2*a)
        return (x1, x2)
    elseif discriminant == 0
        # Один корень (кратность 2)
        x = -b / (2*a)
        return (x, x)
    else
        # Нет действительных корней
        return (nothing, nothing)
    end
end

# Пример использования:
# roots = solve_quadratic(1, -5, 6)
# println("Корни: ", roots)
