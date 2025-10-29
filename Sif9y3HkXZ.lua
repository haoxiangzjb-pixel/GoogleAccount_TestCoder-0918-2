-- Lua table to store student grades
local studentGrades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- Function to calculate average grade
function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- Calculate the average grade
local averageGrade = calculateAverage(studentGrades)

-- Print the grades and average
print("Student Grades:")
for name, grade in pairs(studentGrades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", averageGrade))

-- Store data in a table for saving
local result = {
    grades = studentGrades,
    average = averageGrade
}

return result