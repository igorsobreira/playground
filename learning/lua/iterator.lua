-- iterator implementation using closures

function values(table) 
    local i = 0
    return  function (invariant_state, control_variable)
                i = i + 1
                if table[i] ~= nil then return table[i] end
            end
end

for value in values{"lua", "python", "c"} do
    print(value)
end
