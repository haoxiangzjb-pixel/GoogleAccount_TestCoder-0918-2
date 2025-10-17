-- Lua script to store student grades in a table and calculate average
local student_grades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88}
}

-- Function to calculate average grade
function calculate_average(grades)
    local sum = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        sum = sum + student.grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- Calculate the average
local avg = calculate_average(student_grades)

-- Print the results
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print("  " .. student.name .. ": " .. student.grade)
end

print("\nAverage Grade: " .. string.format("%.2f", avg))

-- Save to a randomly named file
local random_name = "grades_" .. math.random(10000, 99999) .. ".lua"
local file = io.open(random_name, "w")

if file then
    file:write("-- Student grades and average\n")
    file:write("local student_grades = {\n")
    
    for i, student in ipairs(student_grades) do
        file:write("    {name = \"" .. student.name .. "\", grade = " .. student.grade .. "},\n")
    end
    
    file:write("}\n")
    file:write("local average = " .. avg .. "\n")
    file:write("return {grades = student_grades, average = average}\n")
    
    file:close()
    print("\nData saved to: " .. random_name)
else
    print("Error: Could not create file " .. random_name)
end