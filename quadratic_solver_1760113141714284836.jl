# Функция для решения квадратного уравнения ax^2 + bx + c = 0
function solve_quadratic(a, b, c)
    # Проверка, является ли a нулем
    if a == 0
        if b == 0
            # Если a и b равны нулю, уравнение не имеет решений или имеет бесконечное количество решений
            if c == 0
                println("Уравнение имеет бесконечное количество решений (0 = 0).")
                return []
            else
                println("Уравнение не имеет решений (например, 0 = $c).")
                return []
            end
        else
            # Линейное уравнение bx + c = 0
            x = -c / b
            println("Уравнение линейное. Решение: x = $x")
            return [x]
        end
    end

    # Вычисление дискриминанта
    D = b^2 - 4*a*c

    if D > 0
        # Два различных действительных корня
        x1 = (-b + sqrt(D)) / (2*a)
        x2 = (-b - sqrt(D)) / (2*a)
        println("Два различных действительных корня: x1 = $x1, x2 = $x2")
        return [x1, x2]
    elseif D == 0
        # Один действительный корень (кратный корень)
        x = -b / (2*a)
        println("Один действительный корень (кратный): x = $x")
        return [x]
    else
        # Комплексные корни
        real_part = -b / (2*a)
        imag_part = sqrt(-D) / (2*a)
        x1 = complex(real_part, imag_part)
        x2 = complex(real_part, -imag_part)
        println("Комплексные корни: x1 = $x1, x2 = $x2")
        return [x1, x2]
    end
end

# Примеры использования
println("Пример 1: x^2 - 5x + 6 = 0 (a=1, b=-5, c=6)")
solve_quadratic(1, -5, 6)

println("\nПример 2: x^2 - 2x + 1 = 0 (a=1, b=-2, c=1)")
solve_quadratic(1, -2, 1)

println("\nПример 3: x^2 + 1 = 0 (a=1, b=0, c=1)")
solve_quadratic(1, 0, 1)

println("\nПример 4: Линейное уравнение 2x + 3 = 0 (a=0, b=2, c=3)")
solve_quadratic(0, 2, 3)