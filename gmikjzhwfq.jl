# Función para resolver una ecuación lineal de la forma ax + b = 0
function solve_linear_equation(a, b)
    if a == 0
        if b == 0
            # Infinitas soluciones si 0x + 0 = 0
            return "Infinitas soluciones"
        else
            # No hay solución si 0x + b = 0 con b ≠ 0
            return "No hay solución"
        end
    else
        # Solución única x = -b/a
        x = -b / a
        return x
    end
end

# Ejemplo de uso
println("Ejemplos de resolución de ecuaciones lineales:")
println("Ecuación 2x + 6 = 0, x = ", solve_linear_equation(2, 6))
println("Ecuación 5x - 10 = 0, x = ", solve_linear_equation(5, -10))
println("Ecuación 0x + 0 = 0, x = ", solve_linear_equation(0, 0))
println("Ecuación 0x + 5 = 0, x = ", solve_linear_equation(0, 5))