-- stateless iterator

function keys_values_iter(table, index)
    index = index + 1
    if table[index] ~= nil then
        return index, table[index]
    end
end

function keys_values(table)
    return keys_values_iter, table, 0
end

-- being stateless, which means it doesn't use variables from the closure,
-- it can be consumed more than once

table = {"igor", "dutra", "sobreira"}
iter, state, start = keys_values(table)

for key,value in iter, state, start do
    print(key, value)
end

print("")

for key,value in iter, state, start do
    print(key, value)
end
