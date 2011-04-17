
function do_something()
    for y,v in pairs{"foo","bar"} do
        coroutine.yield(v)
    end
end

function something()
    return coroutine.wrap(function() do_something() end)
end

for v in something() do 
    print(v)
end
