"""
    solve_linear_equation(a, b)

Resuelve la ecuación lineal de la forma: a * x = b

# Argumentos
- `a`: Coeficiente de la variable x
- `b`: Término independiente

# Retorna
- El valor de x que satisface la ecuación, o un mensaje especial si no hay solución única.

# Ejemplos
```julia
julia> solve_linear_equation(2, 6)
3.0

julia> solve_linear_equation(0, 5)
"No tiene solución"

julia> solve_linear_equation(0, 0)
"Infinitas soluciones"
```
"""
function solve_linear_equation(a::Real, b::Real)
    if a == 0
        if b == 0
            return "Infinitas soluciones"
        else
            return "No tiene solución"
        end
    else
        return b / a
    end
end

# Ejemplo de uso
if abspath(PROGRAM_FILE) == @__FILE__
    println("Ejemplo: Resolver 3x = 12")
    resultado = solve_linear_equation(3, 12)
    println("x = ", resultado)
end
