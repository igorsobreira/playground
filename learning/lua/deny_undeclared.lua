-- deny access to undeclared global variables

local declared = {}

local mt = {
    
    __newindex = function(table, name, value)
        if not declared[name] then
            local info = debug.getinfo(2, "S")
            if info ~= "main" and info ~= "C" then 
                error("Attempt to write to undeclared variable "..name)
            else
                declared[name] = true
            end
        end
        rawset(table, name, value)
    end,

    __index = function(table, name)
        if not declared[name] then
            error("Attempt to read undeclared variable "..name)
        end
    end,
}
setmetatable(_G, mt)

bar = "foo"
print(name)


