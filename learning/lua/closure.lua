
function counter()
    local i = 0
    return function () 
               i = i + 1
               return i
           end
end

c = counter()
print(c())
print(c())
