-- Функция Lua для вычисления площади круга
local function circleArea(radius)
    if radius < 0 then
        error("Радиус не может быть отрицательным")
    end
    return math.pi * radius * radius
end

-- Пример использования
local radius = 10
local area = circleArea(radius)
print("Площадь круга с радиусом " .. radius .. " равна " .. area)

-- Возврат функции для возможного импорта
return {
    circleArea = circleArea
}