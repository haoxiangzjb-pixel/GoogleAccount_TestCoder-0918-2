-- 学生成绩表
local student_grades = {
    {name = "张三", score = 85},
    {name = "李四", score = 92},
    {name = "王五", score = 78},
    {name = "赵六", score = 88},
    {name = "钱七", score = 95}
}

-- 计算平均分
local total = 0
for i, student in ipairs(student_grades) do
    total = total + student.score
end

local average = total / #student_grades

-- 输出结果
print("学生成绩列表:")
for i, student in ipairs(student_grades) do
    print(i .. ". " .. student.name .. ": " .. student.score)
end

print("\n平均分: " .. string.format("%.2f", average))

-- 将数据保存到文件
local file_name = "grades_output_" .. math.random(10000, 99999) .. ".lua"
local file = io.open(file_name, "w")

if file then
    file:write("-- 学生成绩及平均分\n")
    file:write("local student_grades = {\n")
    for i, student in ipairs(student_grades) do
        file:write("    {name = \"" .. student.name .. "\", score = " .. student.score .. "},\n")
    end
    file:write("}\n\n")
    file:write("-- 平均分\n")
    file:write("local average = " .. average .. "\n\n")
    file:write("return {grades = student_grades, average = average}\n")
    file:close()
    
    print("\n数据已保存到文件: " .. file_name)
else
    print("无法创建文件: " .. file_name)
end