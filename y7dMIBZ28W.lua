-- Lua表存储学生成绩
local student_grades = {
    {name = "Alice", score = 85},
    {name = "Bob", score = 92},
    {name = "Charlie", score = 78},
    {name = "Diana", score = 96},
    {name = "Eve", score = 88}
}

-- 计算平均分
local total_score = 0
local student_count = #student_grades

for i, student in ipairs(student_grades) do
    total_score = total_score + student.score
end

local average_score = total_score / student_count

-- 打印结果
print("学生成绩:")
for i, student in ipairs(student_grades) do
    print("  " .. student.name .. ": " .. student.score)
end

print("\n平均分: " .. string.format("%.2f", average_score))

-- 返回结果用于其他用途
return {
    students = student_grades,
    average = average_score
}