-- Lua的元表Metatable

--[[
    metatable是啥呢？怎么说呢，定义table的操作，两个table相加，有没有一种C++中运算符重载的感觉，也有点像Java中的Object方法重写，话不多说，看例子
]]


t = setmetatable({
    name = "LiuShu"
}, {
    __index = { -- 有点像合并两个table哈
        age = 22,
        sex = "man"
    }
})

print(t.name, t.age, t.sex, t.hp)

t = setmetatable({
    name = "LiuShu"
}, {
    __index = function (mytable, key) -- 当前面table没有此key时进入这个__index
        for k,v in pairs(mytable) do
            print(k,v) -- 这个就是前面的table
        end
        local new_t = {
            age = 22,
            sex = "man"
        }
        if new_t[key] == nil then
            return "No this key"
        else
            return new_t[key]
        end
    end
})

print(t.name, t.age, t.sex, t.hp)

t = setmetatable({
    name = "LiuShu"
}, {
    __newindex = {} -- 阻止了新的赋值，也就是说新赋的值进入了这个table里面
})

t.age = 22

print(t.name, t.age) -- 没有age

-- 也就是说__newindex 会把新的赋值传入里面，可以手动赋值

t = setmetatable({
    name = "LiuShu"
}, {
    __newindex = function (mytable, key, value)
        print(key, value) -- 可以看见新的键值已经传入
        --[[
            mytable[key] = value
            这是错误的赋值，因为这样会再次进入__newindex，这样就造成了死循环
        ]]
        rawset(mytable, key, value) -- 不考虑Metatable元表，只使用原始table，对应的还有rawget(mytable, key)
    end
})

t.age = 22

print(t.name, t.age)


-- 操作符 就像C++中运算符重载 这里用+举例

t = setmetatable({60, 20, 30}, {
    __add = function (mytable, newtable)
        for i, v in ipairs(newtable) do
            table.insert(mytable, v)
        end
        return mytable
    end
})

t1 = {80, 50, 90, 10}
t = t + t1 -- 重载了加号合并了两个数组

for i, v in ipairs(t) do
    print(i, v)
end

t = setmetatable({
    hour = 10,
    minute = 20,
    second = 30
}, {
    __add = function (mytable, newtable)
        mytable.second = mytable.second + newtable.second
        mytable.minute = mytable.minute + newtable.minute
        mytable.hour = mytable.hour + newtable.hour
        mytable.minute = mytable.minute + math.modf(mytable.second / 60)
        mytable.second = mytable.second % 60
        mytable.hour = mytable.hour + math.modf(mytable.minute / 60)
        mytable.minute = mytable.minute % 60
        mytable.hour = mytable.hour % 24
        return mytable
    end
})

t1 = {
    hour = 12,
    minute = 43,
    second = 53
}

t = t + t1 -- 重载了加号 可以进行时间的加法

print(t.hour, t.minute, t.second)

--[[
    可重载的运算符
    __add	对应的运算符 '+'.
    __sub	对应的运算符 '-'.
    __mul	对应的运算符 '*'.
    __div	对应的运算符 '/'.
    __mod	对应的运算符 '%'.
    __unm	对应的运算符 '-'.
    __concat	对应的运算符 '..'.
    __eq	对应的运算符 '=='.
    __lt	对应的运算符 '<'.
    __le	对应的运算符 '<='.
]]

t = setmetatable({10}, {
    __call = function (mytable, newtable) -- 这个__call就等于定义了一个方法
        local sum = 0
        for i, v in ipairs(mytable) do
            sum = sum + v
        end
        for i, v in ipairs(newtable) do
            sum = sum + v
        end
        return sum
    end
})

t1 = {20, 30}

print(t(t1))


-- __tostring元方法

t = setmetatable({
    name = "LiuShu",
    age = 22,
    sex = "man"
}, {
    __tostring = function (mytable) -- 和Java重写tostring()方法基本一致
        return string.format(
            "{\n  name: %s\n  age: %d\n  sex: %s\n}",
            mytable.name, mytable.age, mytable.sex
        )
    end
})

print(t)
