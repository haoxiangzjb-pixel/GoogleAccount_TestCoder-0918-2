-- Lua script to store student grades and calculate average
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- Function to calculate average grade
function calculate_average(grades)
    local sum = 0
    local count = 0
    
    for name, grade in pairs(grades) do
        sum = sum + grade
        count = count + 1
    end
    
    if count == 0 then
        return 0
    else
        return sum / count
    end
end

-- Calculate and print the average
local avg = calculate_average(student_grades)
print("Student Grades:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\nAverage Grade: " .. string.format("%.2f", avg))

-- Return the table and average for use if imported
return {
    grades = student_grades,
    average = avg
}