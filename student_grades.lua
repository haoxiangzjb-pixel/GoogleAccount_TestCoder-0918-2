-- Lua表存储学生成绩并计算平均分

-- 创建学生成绩表
local student_grades = {
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
    ["Diana"] = 96,
    ["Eve"] = 88
}

-- 计算平均分
local total = 0
local count = 0

for name, grade in pairs(student_grades) do
    total = total + grade
    count = count + 1
end

local average = total / count

-- 输出结果
print("学生成绩列表:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\n总分: " .. total)
print("学生人数: " .. count)
print("平均分: " .. string.format("%.2f", average))

-- 返回结果（如果在其他脚本中引用此文件）
return {
    grades = student_grades,
    total = total,
    count = count,
    average = average
}