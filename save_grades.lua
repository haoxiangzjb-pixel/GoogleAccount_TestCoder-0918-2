-- 生成随机文件名的函数
function generateRandomFilename()
    local random_part = math.random(10000, 99999)
    local time_part = os.time()
    return "grades_" .. time_part .. "_" .. random_part .. ".lua"
end

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

-- 计算平均分
local average = calculateAverage(studentGrades)

-- 生成随机文件名
local filename = generateRandomFilename()

-- 打开文件进行写入
local file = io.open(filename, "w")
if file then
    -- 写入学生成绩表
    file:write("-- 学生成绩数据\n")
    file:write("local studentGrades = {\n")
    for i, student in ipairs(studentGrades) do
        file:write(string.format("    {name = \"%s\", grade = %d},\n", student.name, student.grade))
    end
    file:write("}\n\n")
    
    -- 写入平均分
    file:write(string.format("local average = %.2f\n\n", average))
    
    -- 写入访问数据的函数
    file:write("-- 返回学生成绩和平均分\n")
    file:write("return {\n")
    file:write("    students = studentGrades,\n")
    file:write("    average = average\n")
    file:write("}\n")
    
    file:close()
    print("学生成绩已保存到文件: " .. filename)
    print("平均分: " .. string.format("%.2f", average))
else
    print("无法创建文件: " .. filename)
end