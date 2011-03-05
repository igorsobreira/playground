'''

Given a tree (BST), prints all it's elements
by level.
        
        5
    3       8
  1   4   6   9

For the above tree, the output would be:

5
3 8
1 4 6 9

'''

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.level = None

    def __str__(self):
        return str(self.data)


def print_by_level(node):
    node.level = 1
    queue = [node]
    output = ''
    current_level = node.level

    while len(queue) > 0:
        current_node = queue.pop(0)
        
        if current_node.level > current_level:
            terminator = '\n'
            current_level += 1
        elif current_level == 1:
            terminator = ''
        else:
            terminator = ' '

        output += terminator
        output += str(current_node)

        if current_node.left:
            current_node.left.level = current_level + 1
            queue.append(current_node.left)
        if current_node.right:
            current_node.right.level = current_level + 1
            queue.append(current_node.right)

    return output + '\n'


if __name__ == '__main__':
    
    # build the tree described in the example above
    root = Node(5)
    root.left = Node(3)
    root.right = Node(8)

    result = print_by_level(root)
    assert '5\n3 8\n' == result, repr(result)

    root.left.left = Node(1)
    root.left.right = Node(4)
    
    root.right.left = Node(6)
    root.right.right = Node(9)

    result = print_by_level(root)
    assert '5\n3 8\n1 4 6 9\n' == result, repr(result)

    print result
