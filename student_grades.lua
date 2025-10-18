-- Lua script to create a table for storing student grades, calculate average, and save to a file

-- Create a table to store student grades
local student_grades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88}
}

-- Function to calculate average grade
local function calculate_average(grades)
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
local average_grade = calculate_average(student_grades)

-- Print the results
print("Student Grades:")
for i, student in ipairs(student_grades) do
    print(i .. ". " .. student.name .. ": " .. student.grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average_grade))

-- Generate a random filename
local random_name = ""
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
math.randomseed(os.time())
for i = 1, 10 do
    random_name = random_name .. chars:sub(math.random(1, #chars), math.random(1, #chars))
end
local filename = random_name .. ".lua"

-- Write the table and average to the file
local file = io.open(filename, "w")
if file then
    file:write("-- Student grades table and average\n")
    file:write("local student_grades = {\n")
    for i, student in ipairs(student_grades) do
        file:write("    {name = \"" .. student.name .. "\", grade = " .. student.grade .. "},\n")
    end
    file:write("}\n\n")
    file:write("local average_grade = " .. average_grade .. "\n")
    file:write("return {grades = student_grades, average = average_grade}\n")
    file:close()
    print("\nData saved to: " .. filename)
else
    print("Error: Could not create file " .. filename)
end