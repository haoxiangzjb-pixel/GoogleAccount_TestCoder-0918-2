-- Функция Lua для вычисления площади круга
local function computeCircleArea(radius)
    -- Проверка, что радиус не отрицательный
    if radius < 0 then
        error("Радиус должен быть неотрицательным значением")
    end
    
    -- Вычисление площади круга по формуле: π * r^2
    local area = math.pi * radius * radius
    return area
end

-- Функция для вычисления площади круга с дополнительной информацией
local function circleAreaDetailed(radius)
    if radius < 0 then
        error("Радиус должен быть неотрицательным значением")
    end
    
    local area = computeCircleArea(radius)
    print("Радиус круга: " .. radius)
    print("Площадь круга: " .. area)
    
    return area
end

-- Пример использования функций
local testRadius = 4.5
local area = computeCircleArea(testRadius)
print("Площадь круга с радиусом " .. testRadius .. " равна " .. string.format("%.3f", area))

-- Возвращаем обе функции
return {
    computeCircleArea = computeCircleArea,
    circleAreaDetailed = circleAreaDetailed
}