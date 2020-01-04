-- Lua的Table
-- Table = 数组 + 映射

-- 数组
a = {}
a[0] = 1
a[1] = true
a[2] = 3.14
a[3] = "Hello"

print(a[0], a[1], a[2], a[3])

b = {
    2,
    false,
    2.71828,
    "World"
}

print(b[0], b[1], b[2], b[3]) -- nil	2	false	2.71828
print(b[1], b[2], b[3], b[4]) -- 数组下标从1开始！！！！！！

-- 映射
c = {}
c["name"] = "LiuShu"
c["age"] = 22
c[6] = "Hello"

print(c[0], c[1], c[2], c[3], c[4], c[5], c[6]) -- 可以和数组混着存储，但不可以用下标调用映射
print(c["name"], c["age"])
print(c.name, c.age)

d = {
    ["name"] = "liujingshi",
    ["sex"] = "man",
    [8] = "World"
}

print(d.name, d.sex, d[8])