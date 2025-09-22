-- 定义一个包含学生成绩的表
local student_scores = {
    { name = "Alice", math = 95, english = 87, science = 92 },
    { name = "Bob", math = 78, english = 82, science = 85 },
    { name = "Charlie", math = 90, english = 94, science = 88 }
}

-- 计算每个学生的平均分
for i, student in ipairs(student_scores) do
    local average = (student.math + student.english + student.science) / 3
    student.average = average
end

-- 打印结果
for i, student in ipairs(student_scores) do
    print(student.name .. "'s average score is: " .. string.format("%.2f", student.average))
end