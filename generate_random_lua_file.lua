-- 生成随机命名的Lua文件并保存学生成绩数据

-- 引入math库以生成随机数
math.randomseed(os.time())

-- 生成随机文件名的函数
local function generate_random_filename()
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local filename = "grades_"
    
    for i = 1, 8 do  -- 生成8位随机字符
        local index = math.random(1, #charset)
        filename = filename .. charset:sub(index, index)
    end
    
    filename = filename .. ".lua"
    return filename
end

-- 学生成绩数据
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

-- 生成随机文件名
local random_filename = generate_random_filename()

-- 创建并写入随机命名的Lua文件
local file = io.open(random_filename, "w")
if file then
    file:write("-- 学生成绩数据 - 随机生成的文件\n")
    file:write("\n-- 学生成绩表\n")
    file:write("local student_grades = {\n")
    
    for name, grade in pairs(student_grades) do
        file:write(string.format('    ["%s"] = %d,\n', name, grade))
    end
    
    file:write("}\n\n")
    file:write(string.format("-- 计算结果\nlocal total = %d\n", total))
    file:write(string.format("local count = %d\n", count))
    file:write(string.format("local average = %.2f\n", average))
    
    file:write("\n-- 输出结果\n")
    file:write('print("学生成绩列表:")\n')
    file:write("for name, grade in pairs(student_grades) do\n")
    file:write('    print(name .. ": " .. grade)\n')
    file:write("end\n")
    file:write('\nprint("\\n总分: " .. total)\n')
    file:write('print("学生人数: " .. count)\n')
    file:write('print("平均分: " .. string.format("%.2f", average))\n')
    
    file:close()
    
    print("已生成随机命名的Lua文件: " .. random_filename)
    print("文件内容:")
    print("学生成绩列表:")
    for name, grade in pairs(student_grades) do
        print(name .. ": " .. grade)
    end
    print("\n总分: " .. total)
    print("学生人数: " .. count)
    print("平均分: " .. string.format("%.2f", average))
else
    print("无法创建文件: " .. random_filename)
end