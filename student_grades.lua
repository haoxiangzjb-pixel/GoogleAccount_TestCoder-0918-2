-- Lua表存储学生成绩并计算平均分

-- 学生成绩表
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
print("学生成绩列表:")
for i, student in ipairs(student_grades) do
    print("  " .. student.name .. ": " .. student.score)
end

print("\n总分: " .. total_score)
print("学生人数: " .. student_count)
print("平均分: " .. string.format("%.2f", average_score))

-- 将数据保存到表中
local result_data = {
    students = student_grades,
    total_score = total_score,
    student_count = student_count,
    average_score = average_score
}

-- 返回结果
return result_data