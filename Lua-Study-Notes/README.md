# Lua学习笔记

---

* Lua环境搭建 [[Lua官方网站]](http://www.lua.org/)
  
  * Mac OS X

    * 直接在终端执行命令

    ``` bash
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar zxf lua-5.3.5.tar.gz
    cd lua-5.3.5
    make macosx test
    sudo make install
    ```

  * Linux

    * 直接在终端执行命令

    ``` bash
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar zxf lua-5.3.5.tar.gz
    cd lua-5.3.5
    make linux test
    sudo make install
    ```

  * Windows

    * 打开[LuaBinaries网站](http://luabinaries.sourceforge.net/)

    * 找到History一栏

    * 找到想下载的版本，我下载的是[Lua 5.3.5 - Release 1](https://sourceforge.net/projects/luabinaries/files/5.3.5/)

    * 点击 Download Latest Version 进行下载

    * 下载完是一个zip压缩文件，解压完能看见一个dll和三个exe

    * 添加到环境变量后可以使用`lua53 test.lua`

* 运行Lua文件 `./HeloWorld.lua`

  * 新建一个Lua文件，test.lua，写入下列内容

    ``` lua
    print("Hello World!")
    ```

  * 在终端中输入下列命令运行

    ``` bash
    lua test.lua
    ```

  * 运行结果

    ``` bash
    Hello World!
    ```

* Lua的值和类型 `./Lua001.lua`

  * 弱类型

  * 直接给变量赋值和Python差不多

  * 详情见文件

    ``` lua
    a = 1
    b = "Hello"
    print(a, b)
    ```

* Lua的Table `./Lua002.lua`

  * table就是数组，字典

  * 用大括号 `a = {}`

  * 数组下标从1开始

  * 可以同时使用键值对和数组下标

  * 详情见文件

    ``` lua
    t = {
      ["name"] = "liushu",
      ["age"] = 22,
      [6] = "Hello"
    }
    print(t["name"], t.age, t[6])
    ```

* Lua的函数 `./Lua003.lua`

  * 关键字`function`定义函数，这种类似于`JavaScript`

  * 没有大括号，没有冒号，以`end`结束，这种类似于`Visual Basic`

  * 支持多返回值

  * 详情见文件

    ``` lua
    function add(a, b)
      return a + b
    end

    print(add(1, 2))
    ```

* Lua的表达式

  * 没有 `++` `+=` 等运算

  * 逻辑运算 `and` `or` `not`

  * 字符串连接用 `..`

    ``` lua
    a = "Hello"
    b = "World"
    c = a .. b
    ```

  * 正常变量全是全局变量，使用`local`定义局部变量

    ``` lua
    function foo()
      local a = "Hello"
    end
    ```

  * 详情见文件

* Lua的流程控制 `./Lua005.lua`

  * if语句，感觉有一丢丢类似于`Visual Basic`

    ``` lua
    a = 1
    if a == 1 then
      print("1")
    elseif a == 2 then
      print("2")
    else
      print("3")
    end
    ```

  * while语句

    ``` lua
    i = 0
    while i < 10 do
      print(i)
      i = i + 1
    end
    ```

  * for语句，起始，终结，步长（默认1）

    ``` lua
    for i = 10, 1, -1 do
      print(i)
    end
    ```

  * for语句迭代器，pairs()遍历数组和映射（无顺序），ipairs()只遍历数组

    ``` lua
    a = {
      ["name"] = 666,
      [6] = "Lua",
    }
    for k, v in pairs(a) do
      print(k, v)
    end
    ```

  * 详情见文件

* Lua的包 `./Lua006.lua` `./foo.lua` `./foo1.lua` `./foo2.lua`

  * 包就是一个单独的lua文件返回一个table，可以是匿名的

    ``` lua
    p = {}
    function p.add(a, b)
      return a + b
    end
    return p
    ```

  * 在另一个文件可以`require`一个包

    ``` lua
    require("p")
    print(p.add(1, 2))
    ```

  * 详情见文件

* Lua的常用系统函数 `./Lua007.lua`

  * `table.insert(table, index, value)` 只能向数组添加元素

  * `table.remove(table, value)` 移除的是元素

  * `#t` 数组或字符串长度

  * `type()` 查看变量类型

  * `tonumber("3.14")` 字符串转数值

  * `tostring(2.71828)` 数值转字符串

  * `string.format("Hello%d", 1)` 字符串格式化，类似C#

  * 详情见文件

* Lua的元表Metatable `./Lua008.lua`

  * 详情见文件

    > 说一下这个Metatable，个人理解，定义table的一些行为，比如说两个table相加，需要将两个数组合并到一起，又或者说像C++中运算符重载，再比如`__tostring`元方法，就像是Java中重写Object类中的`tostring()`方法
