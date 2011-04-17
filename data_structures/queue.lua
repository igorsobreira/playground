-- Queue implementation
--
-- Usage:
--
-- require "queue"
-- q = queue.Queue:new()
-- q:add("foo")
-- q:add("bar")
-- q.get()      -- returns "foo"
-- q.get()      -- returns "bar"

module("queue", package.seeall)

Queue = {
    first = 1,
    list = {},
}

function Queue:new()
    local q = {}
    self.__index = self
    setmetatable(q, self)
    return q
end

function Queue:add(v)
    self.list[#self.list+1] = v
end

function Queue:get()
    local v = self.list[self.first]
    self.list[self.first] = nil
    self.first = self.first + 1
    return v
end
