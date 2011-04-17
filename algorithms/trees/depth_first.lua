--[[

Implementation of two depth-first algorithms: inorder and postorder
on a binary tree.

        5
    3       8
  1   4   6   9

--]]

require "lunatest"

Node = {}

function Node:new(value)
    local node = {value=value}
    setmetatable(node, {__index=Node})
    return node
end


Buffer = {}

function Buffer:new()
    local b = {}
    setmetatable(b, {__index=Buffer})
    return b
end

function Buffer:add(value)
    table.insert(self, #self+1, value)
end

function Buffer:join()
    return table.concat(self, " ")
end


function inorder(node)
    local buffer = Buffer:new()
    
    function visit(node)
        if node ~= nil then
            visit(node.left)
            buffer:add(node.value)
            visit(node.right)
        end
    end

    visit(node)
    return buffer:join()
end

function postorder(node)
    local buffer = Buffer:new()

    function visit(node)
        if node ~= nil then
            visit(node.left)
            visit(node.right)
            buffer:add(node.value)
        end
    end

    visit(node)
    return buffer:join()
end


function preorder(node)
    local buffer = Buffer:new()

    function visit(node)
        if node ~= nil then
            buffer:add(node.value)
            visit(node.left)
            visit(node.right)
        end
    end

    visit(node)
    return buffer:join()
end


function test_inorder()
    assert_equal("1 3 4 5 6 8 9", inorder(build_tree()))
end

function test_postorder()
    assert_equal("1 4 3 6 9 8 5", postorder(build_tree()))
end

function test_preorder()
    assert_equal("5 3 1 4 8 6 9", preorder(build_tree())) 
end

function build_tree()
    local root = Node:new(5)

    root.left = Node:new(3)
    root.right = Node:new(8)
    root.left.left = Node:new(1)
    root.left.right = Node:new(4)
    root.right.left = Node:new(6)
    root.right.right = Node:new(9)

    return root
end

lunatest.run()
