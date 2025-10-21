function calculateCircleArea(radius)
    if radius < 0 then
        return 0
    end
    return math.pi * radius * radius
end
print('Area of circle with radius 5: ' .. calculateCircleArea(5))
