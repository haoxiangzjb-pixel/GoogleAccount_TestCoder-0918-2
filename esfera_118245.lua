-- Función para calcular el volumen de una esfera
function volumen_esfera(radio)
    local volumen = (4/3) * math.pi * (radio ^ 3)
    return volumen
end

-- Ejemplo de uso
local radio = 5
local volumen = volumen_esfera(radio)
print("El volumen de una esfera con radio " .. radio .. " es: " .. volumen)