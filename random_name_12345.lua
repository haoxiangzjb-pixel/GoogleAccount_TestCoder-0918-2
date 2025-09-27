-- Lua script to store student scores and calculate average

-- Table to store student data
local students = {
    { name = "Alice", score = 95 },
    { name = "Bob", score = 87 },
    { name = "Charlie", score = 92 },
    { name = "David", score = 78 },
    { name = "Eve", score = 88 }
}

-- Calculate the sum of scores
local total_score = 0
for i, student in ipairs(students) do
    total_score = total_score + student.score
end

-- Calculate the average
local num_students = #students
local average_score = total_score / num_students

-- Print the results
print("Student Scores:")
for i, student in ipairs(students) do
    print(string.format("  %s: %d", student.name, student.score))
end

print(string.format("\nTotal Students: %d", num_students))
print(string.format("Average Score: %.2f", average_score))

-- Return the data if needed for further processing
return {
    students = students,
    average = average_score
}