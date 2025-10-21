-- Функция Lua для вычисления площади круга
local function getCircleArea(radius)
    -- Проверка, что радиус не отрицательный
    if radius < 0 then
        error("Радиус должен быть неотрицательным значением")
    end
    
    -- Вычисление площади круга по формуле: π * r^2
    local area = math.pi * radius * radius
    return area
end

-- Пример использования функции
local radius = 3
local area = getCircleArea(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. string.format("%.2f", area))

-- Возвращаем функцию, чтобы её можно было использовать в других скриптах
return {
    getCircleArea = getCircleArea
}