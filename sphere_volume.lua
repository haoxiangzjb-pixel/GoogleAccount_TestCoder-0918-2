-- Función para calcular el volumen de una esfera
function sphere_volume(radius)
    if radius < 0 then
        error("El radio no puede ser negativo")
    end
    local pi = math.pi
    return (4/3) * pi * (radius ^ 3)
end

-- Ejemplo de uso
local r = 5
local vol = sphere_volume(r)
print("El volumen de una esfera con radio " .. r .. " es: " .. vol)