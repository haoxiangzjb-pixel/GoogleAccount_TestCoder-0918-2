"""
    solve_linear_equation(a, b)

Resuelve la ecuación lineal de la forma: a*x = b

# Argumentos
- `a`: Coeficiente de x (debe ser diferente de 0)
- `b`: Término independiente

# Retorna
- El valor de x que satisface la ecuación

# Ejemplo
```julia
julia> solve_linear_equation(2, 6)
3.0
```
"""
function solve_linear_equation(a::Real, b::Real)
    if a == 0
        if b == 0
            error("La ecuación tiene infinitas soluciones (0x = 0)")
        else
            error("La ecuación no tiene solución (0x = $b)")
        end
    end
    return b / a
end

# Ejemplo de uso
if abspath(PROGRAM_FILE) == @__FILE__
    println("Ejemplo: resolver 2x = 6")
    resultado = solve_linear_equation(2, 6)
    println("x = ", resultado)
end
