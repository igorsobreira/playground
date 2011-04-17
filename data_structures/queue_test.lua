
require "queue"
require "lunatest"

function test_add_and_get_element_from_queue()
    local q = queue.Queue:new()
    q:add("foo")

    assert_equal("foo", q:get())
end

function test_add_and_get_multiple_elements_from_queue()
    local q = queue.Queue:new()
    q:add("foo")
    q:add("bar")
    q:add("egg")

    assert_equal("foo", q:get())
    assert_equal("bar", q:get())
    assert_equal("egg", q:get())
end

function test_add_and_get_multiple_elements_from_queue_randomly()
    local q = queue.Queue:new()
    q:add("foo")
    q:add("bar")

    assert_equal("foo", q:get())

    q:add("egg")

    assert_equal("bar", q:get())
    assert_equal("egg", q:get())
end

lunatest.run()
