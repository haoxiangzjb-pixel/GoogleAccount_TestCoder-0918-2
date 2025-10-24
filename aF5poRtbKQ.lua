-- Lua table to store student grades
local studentGrades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88}
}

-- Function to calculate average grade
function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        sum = sum + student.grade
        count = count + 1
    end
    
    if count == 0 then
        return 0
    else
        return sum / count
    end
end

-- Calculate and print the average
local average = calculateAverage(studentGrades)
print("Student Grades:")
for i, student in ipairs(studentGrades) do
    print(student.name .. ": " .. student.grade)
end

print("\nAverage Grade: " .. string.format("%.2f", average))

-- Return the table and average for potential use in other scripts
return {
    grades = studentGrades,
    average = average
}