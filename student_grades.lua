-- 学生成绩表
local studentGrades = {
    {name = "张三", grade = 85},
    {name = "李四", grade = 92},
    {name = "王五", grade = 78},
    {name = "赵六", grade = 88},
    {name = "钱七", grade = 95}
}

-- 计算平均分函数
function calculateAverage(grades)
    local total = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        total = total + student.grade
        count = count + 1
    end
    
    if count > 0 then
        return total / count
    else
        return 0
    end
end

-- 计算并显示平均分
local average = calculateAverage(studentGrades)
print("学生成绩表:")
for i, student in ipairs(studentGrades) do
    print("  " .. student.name .. ": " .. student.grade)
end
print("平均分: " .. string.format("%.2f", average))

-- 返回数据以便保存
return {
    students = studentGrades,
    average = average
}