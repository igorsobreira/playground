--[[

Given a tree (BST), prints all it's elements
by level.
        
        5
    3       8
  1   4   6   9

For the above tree, the output would be:

5
3 8
1 4 6 9

--]]

require "lunatest"


-- queue abstraction 
local queue = {}

function queue.push(v)
    table.insert(queue, #queue+1, v)
end

function queue.pop()
    return table.remove(queue, 1)
end

function queue.is_empty()
    return table.maxn(queue) == 0
end


-- buffer abstraction
local buffer = {}

function buffer.add(v)
    buffer[#buffer+1] = v
end

function buffer.print()
    return table.concat(buffer, "")
end


Node = {}

function Node:new(value)
    local node = {value=value}
    setmetatable(node, {__index=Node})
    return node
end


-- use BFS to print a tree line by line
function print_by_level(node)

    node.level = 1
    queue.push(node)
    
    local current_level = node.level

    while not queue.is_empty() do

        node = queue.pop()
        if node then 
            if node.level > current_level then
                buffer.add("\n")
                current_level = node.level
            end
            buffer.add(node.value .. " ") 
        end

        if node.left then 
            node.left.level = node.level + 1
            queue.push(node.left)          
        end
        if node.right then 
            node.right.level = node.level + 1
            queue.push(node.right)
        end
    end
    
    buffer.add("\n")
    return buffer.print()
end


function test()
    local root = Node:new(5)

    root.left = Node:new(3)
    root.right = Node:new(8)
    root.left.left = Node:new(1)
    root.left.right = Node:new(4)
    root.right.left = Node:new(6)
    root.right.right = Node:new(9)

    result = print_by_level(root)

    assert_equal("5 \n3 8 \n1 4 6 9 \n", result)
    
    print("\n" .. result)
end

lunatest.run()
