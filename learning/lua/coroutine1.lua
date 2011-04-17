
function receive()
    local status, value = coroutine.resume(producer)
    print("received", status, value)
end

producer = coroutine.create(function()
    while true do
        local value = io.read()
        coroutine.yield(value)
    end
end)

while true do
    receive()
end
