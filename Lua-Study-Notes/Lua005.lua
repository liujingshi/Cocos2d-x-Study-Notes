-- Lua的流程控制

-- if
a = 1
if a == 1 then -- if then 和 Visual Basic 相似
    print("Hello")
elseif a == 2 then
    print("World")
else
    print("Hello World")
end

-- while
i = 0
while i < 5 do -- while do
    print(i)
    i = i + 1
end

-- for
for i = 0, 3 do -- 0 3 都输出了
    print(i)
end

for i = 1, 6, 2 do -- 起始，结束，步长
    print(i)
end

for i = 3, 0, -1 do
    print(i)
end

ljs = {
    ["name"] = "LiuShu",
    ["age"] = 22,
    [6] = "Hello"
}

-- pairs()遍历数组和映射（遍历没顺序） ipairs()遍历数组（从1开始）
for k, v in pairs(ljs) do
    print(k, v)
end

