
function receive(producer)
    local status, value = coroutine.resume(producer)
    return value
end

function consumer(producer)
    while true do
        local value = receive(producer)
        print(value)
    end
end

function producer()
    return coroutine.create(function()
        while true do
            local value = io.read()
            coroutine.yield(value)
        end
    end)
end

function show_lines(producer)
    return coroutine.create(function()
        for i=1,math.huge do
            local value = receive(producer)
            value = string.format("%d: %s", i, value)
            coroutine.yield(value)
        end
    end)
end

p = producer()
consumer(show_lines(p))
