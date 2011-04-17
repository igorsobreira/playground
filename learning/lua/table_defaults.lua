
function setdefault(table, default)
    local mt = {
        __index = function() return default end
    }
    setmetatable(table, mt)
end

t = {}
setdefault(t, "nao encontrado")

print(t.bunda)
