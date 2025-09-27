-- Lua script to store student scores and calculate average

-- Define a table to store student data
local students = {
    { name = "Alice", score = 92 },
    { name = "Bob", score = 85 },
    { name = "Charlie", score = 78 },
    { name = "Diana", score = 96 },
    { name = "Eve", score = 88 }
}

-- Calculate the total score
local total_score = 0
for i, student in ipairs(students) do
    total_score = total_score + student.score
end

-- Calculate the average score
local average_score = total_score / #students

-- Print the student table and the average score
print("Student Scores:")
for i, student in ipairs(students) do
    print(string.format("  %s: %d", student.name, student.score))
end

print(string.format("\nAverage Score: %.2f", average_score))

-- Return the table and average for potential external use
return {
    students = students,
    average = average_score
}