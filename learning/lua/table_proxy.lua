
local _original = {language = "lua"}
local proxy = {} 

proxy.mt = {
    __index = function (table, key)
        print("access element "..tostring(key))
        return _original[key]
    end,

    __newindex = function(table, key, value)
        print("updating "..tostring(key).." with "..tostring(value))
        _original[key] = value
    end
}

setmetatable(proxy, proxy.mt)

--print(proxy.language)
--proxy.language = "python"
--print(proxy.language)
--print(_original.language)


