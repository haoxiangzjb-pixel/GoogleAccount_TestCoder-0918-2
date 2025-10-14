-- Lua script to store student grades and calculate average

-- Define a table to store student data
local student_data = {
    { name = "Alice", grade = 85 },
    { name = "Bob", grade = 92 },
    { name = "Charlie", grade = 78 },
    { name = "Diana", grade = 96 },
    { name = "Eve", grade = 88 }
}

-- Function to calculate the average grade
local function calculate_average(data)
    local sum = 0
    local count = 0
    for i, student in ipairs(data) do
        sum = sum + student.grade
        count = count + 1
    end
    if count == 0 then
        return 0
    end
    return sum / count
end

-- Calculate the average
local average_grade = calculate_average(student_data)

-- Print the results
print("Student Grades:")
for i, student in ipairs(student_data) do
    print("  " .. student.name .. ": " .. student.grade)
end
print("\nAverage Grade: " .. average_grade)

-- Return the data and average if needed for further processing
return {
    grades = student_data,
    average = average_grade
}