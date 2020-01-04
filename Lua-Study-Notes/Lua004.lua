-- Lua的表达式

a = 1 + 1
print(a)

a = 1
b = 2
print((b + 2) * a)

-- 没有 ++ += 等运算

print(true or false)
print(true and false)
print(not false) -- 和Python差不多，不解释

-- 字符串连接 ..

a = "Hello"
b = "World"
c = a .. b
print(c)

-- 全局变量于局部变量

qq = "Hello Lua"
local jj = "jj"

function foo()
    q = "Hello Local"
    local j = "j"
    print(qq)
end

print(q) -- nil

foo()
print(q) -- 需要先执行函数
