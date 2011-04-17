function foo0()
end
function foo1()
    return 'a'
end
function foo2()
    return 'a','b'
end
function foo3()
    return 'a','b','c'
end

function foo(i)
    if i == 0 then return foo0() end
    if i == 1 then return foo1() end
    if i == 2 then return foo2() end
end

t = {"hello", "o"}
f = string.find
print(f(unpack(t)))
