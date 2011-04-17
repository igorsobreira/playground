function ping()
    print("ping")
    return pong()
end

function pong()
    print("pong")
    return ping()
end

ping()
