
local Set = {}

function Set.new(...)
    local set = {}
    setmetatable(set, mt)
    for _, item in pairs{...} do
        set[item] = true
    end
    return set
end

function Set.union(set1, set2)
    local set = Set.new()
    for item in pairs(set1) do set[item] = true end
    for item in pairs(set2) do set[item] = true end
    return set
end

function Set.tostring(set)
    local l = {}
    for item in pairs(set) do
        l[#l+1] = item
    end
    return "(" .. table.concat(l, ", ") .. ")"
end

mt = {
    __add = Set.union,
    __tostring = Set.tostring,
}

set1 = Set.new("igor", "ola", "joh")
set2 = Set.new("mais", "que", "legal")

set = set1 + set2 

print(set)
