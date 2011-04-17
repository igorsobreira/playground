
function fprint(fmt, ...)
    print(string.format(fmt, unpack(arg)))
end

fprint("%s: %d", "igor", 22)
