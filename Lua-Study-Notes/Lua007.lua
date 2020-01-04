-- Lua的常用系统函数

for k, v in pairs(table) do
    print(k, v)
end

--[[
    sort	function: 0x108878a20
    move	function: 0x108878860
    concat	function: 0x108878370
    pack	function: 0x108878620
    unpack	function: 0x1088786b0
    remove	function: 0x108878780
    insert	function: 0x108878530
--]]

t = {}

table.insert(t, 1)
table.insert(t, 2)
table.insert(t, 3)

table.insert( t, 4, "ljs" ) -- 只能添加数组

t.asd = "Hello"

t.asd = nil -- 删除映射

table.remove(t, 1) -- 删除元素 重新索引

print(#t) -- #操作符 数组长度 字符串长度
print(type(t)) -- 变量类型
for k, v in pairs(t) do
    print(k, v)
end

a = tonumber("3.14") -- 转换数值
b = tostring(2.71828) -- 转换字符串
cc = "World";
c = string.format("Hello %s", cc) -- 字符串格式化

print(a, b, c)

