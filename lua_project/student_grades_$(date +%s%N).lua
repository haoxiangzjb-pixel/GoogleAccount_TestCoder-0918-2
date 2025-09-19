-- 学生成绩表
local student_scores = {
    { name = "Alice", scores = {85, 92, 78, 96} },
    { name = "Bob", scores = {70, 88, 82, 79} },
    { name = "Charlie", scores = {95, 90, 93, 88} },
    { name = "David", scores = {60, 75, 68, 72} }
}

-- 计算平均分的函数
local function calculate_average(scores)
    local sum = 0
    for _, score in ipairs(scores) do
        sum = sum + score
    end
    return sum / #scores
end

-- 打印每个学生的平均分
for _, student in ipairs(student_scores) do
    local avg = calculate_average(student.scores)
    print(string.format("%s's average score: %.2f", student.name, avg))
end