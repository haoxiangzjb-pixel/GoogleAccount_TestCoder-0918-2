-- 学生成绩数据 - 随机生成的文件

-- 学生成绩表
local student_grades = {
    ["Diana"] = 96,
    ["Eve"] = 88,
    ["Alice"] = 85,
    ["Bob"] = 92,
    ["Charlie"] = 78,
}

-- 计算结果
local total = 439
local count = 5
local average = 87.80

-- 输出结果
print("学生成绩列表:")
for name, grade in pairs(student_grades) do
    print(name .. ": " .. grade)
end

print("\n总分: " .. total)
print("学生人数: " .. count)
print("平均分: " .. string.format("%.2f", average))
