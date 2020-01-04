-- Lua的函数

function add(a, b) -- 这一行和PHP，JavaScript挺像的
    return a + b
end

print(add(1, 2))

a = 10
b = 20
c = add(a, b)
print(c)

add2 = function(a, b, c) -- 也可以这样，嗯，JavaScript也能这样
    return a + b + c
end

print(add2(1, 2, 3))

foo = add2

print(foo(4, 5, 6))

function add3(a, b, c) -- 和Python差不多支持多返回值
    return a + b, a - b
end

aa, bb = add3(1, 2, 3)
print(aa, bb)

cc = add3(1, 2, 3)
print(cc) -- 这里只写一个变量，只是接收到了第一个返回值，不像Python返回的是一个元组


a1, a2 = 1, 2
a1, a2 = a2, a1
print(a1, a2) -- 也可以像Python这样交换两个数