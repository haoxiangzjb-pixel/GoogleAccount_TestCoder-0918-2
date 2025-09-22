-- Function to calculate the area of a circle
function calculate_circle_area(radius)
    -- Check if radius is a positive number
    if type(radius) ~= "number" or radius <= 0 then
        return nil, "Error: Radius must be a positive number"
    end
    
    -- Calculate area using the formula A = π * r²
    local area = math.pi * radius * radius
    
    return area
end

-- Example usage:
-- local area, error = calculate_circle_area(5)
-- if area then
--     print("Area of circle with radius 5 is: " .. area)
-- else
--     print(error)
-- end