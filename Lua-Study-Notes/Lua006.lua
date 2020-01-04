-- Lua的包（package）

require("foo")
print(foo.add(1, 2))

a = require("foo")
print(a.add(3, 4))

require("foo1")
print(foo1.id, foo1.add(10, 20))

foo2 = require("foo2")
print(foo2.id, foo2.add(100, 200))