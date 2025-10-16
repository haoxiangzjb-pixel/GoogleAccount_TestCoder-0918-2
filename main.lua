-- 主脚本：创建随机命名的Lua文件来存储学生成绩

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

-- 生成随机文件名
local random_name = "grades_" .. math.random(100000, 999999) .. ".lua"

-- 将数据写入随机命名的文件
local file = io.open(random_name, "w")
if file then
    file:write("-- 学生成绩数据\n")
    file:write("local student_data = {\n")
    file:write("    students = {\n")
    
    for i, student in ipairs(student_grades) do
        file:write("        {name = \"" .. student.name .. "\", score = " .. student.score .. "},\n")
    end
    
    file:write("    },\n")
    file:write("    total_score = " .. total_score .. ",\n")
    file:write("    student_count = " .. student_count .. ",\n")
    file:write("    average_score = " .. string.format("%.2f", average_score) .. "\n")
    file:write("}\n\n")
    file:write("return student_data\n")
    
    file:close()
    print("\n数据已保存到文件: " .. random_name)
else
    print("无法创建文件: " .. random_name)
end