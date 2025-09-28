local scores = {
    Alice = 92,
    Bob = 85,
    Charlie = 78,
    Diana = 96,
    Edward = 88
}

local total = 0
local count = 0
for name, score in pairs(scores) do
    total = total + score
    count = count + 1
end

local average = total / count

print("学生平均分: " .. average)

-- 将结果保存到一个表中
local result = {
    students = scores,
    average = average
}

-- 将表转换为字符串（这是一个简单的序列化方法，不适用于复杂表）
local function serialize_table(o)
    if type(o) == "number" then
        return o
    elseif type(o) == "string" then
        return string.format("%q", o)
    elseif type(o) == "table" then
        local s = "{\n"
        for k,v in pairs(o) do
            s = s .. "  [" .. serialize_table(k) .. "] = " .. serialize_table(v) .. ",\n"
        end
        s = s .. "}"
        return s
    else
        error("cannot serialize a " .. type(o))
    end
end

local file_content = "return " .. serialize_table(result)

-- 写入随机命名的文件
local filename = math.random(100000, 999999) .. ".lua"
local file = io.open(filename, "w")
if file then
    file:write(file_content)
    file:close()
    print("结果已保存到文件: " .. filename)
else
    print("无法创建文件")
end
