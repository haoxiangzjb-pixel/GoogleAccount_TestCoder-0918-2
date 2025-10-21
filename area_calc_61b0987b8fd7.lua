-- Функция Lua для вычисления площади круга
local function calculateCircleArea(radius)
    -- Проверка, что радиус не отрицательный
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    
    -- Вычисление площади круга: π * r^2
    local area = math.pi * radius * radius
    return area
end

-- Пример использования функции
local testRadius = 7
local result = calculateCircleArea(testRadius)
print("Площадь круга с радиусом " .. testRadius .. " равна " .. result)

-- Возвращаем функцию для возможности использования в других модулях
return calculateCircleArea