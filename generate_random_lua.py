import random
import string
import os

def generate_random_filename():
    """生成一个随机的Lua文件名"""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.lua"

def create_lua_file_with_grades():
    """创建包含学生成绩的随机命名Lua文件"""
    # 学生成绩数据
    lua_content = '''-- Lua table to store student grades
local studentGrades = {
    {name = "Alice", grade = 85},
    {name = "Bob", grade = 92},
    {name = "Charlie", grade = 78},
    {name = "Diana", grade = 96},
    {name = "Eve", grade = 88}
}

-- Function to calculate average grade
function calculateAverage(grades)
    local sum = 0
    local count = 0
    
    for i, student in ipairs(grades) do
        sum = sum + student.grade
        count = count + 1
    end
    
    if count > 0 then
        return sum / count
    else
        return 0
    end
end

-- Calculate and print the average
local average = calculateAverage(studentGrades)
print("Student Grades:")
for i, student in ipairs(studentGrades) do
    print(student.name .. ": " .. student.grade)
end
print("\\nAverage Grade: " .. string.format("%.2f", average))

-- Return the data for potential external use
return {
    students = studentGrades,
    average = average
}
'''

    # 生成随机文件名
    random_filename = generate_random_filename()
    
    # 写入文件
    with open(f"/workspace/{random_filename}", 'w') as f:
        f.write(lua_content)
    
    print(f"Created Lua file with student grades: {random_filename}")
    return random_filename

if __name__ == "__main__":
    filename = create_lua_file_with_grades()
    print(f"Random Lua file created successfully: /workspace/{filename}")