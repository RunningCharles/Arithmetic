#!/usr/bin/swift

class BSTreeNode {
    var value: Int!
    var left: BSTreeNode?
    var right: BSTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

func insert(_ root: BSTreeNode?, _ value: Int) {
    guard let root = root else { return }
    if value == root.value { return }
    
    if value < root.value {
        if root.left == nil {
            root.left = BSTreeNode(value)
        } else {
            insert(root.left, value)
        }
    } else {
        if root.right == nil {
            root.right = BSTreeNode(value)
        } else {
            insert(root.right, value)
        }
    }
}

func printTreeByLevel (_ root: BSTreeNode) {
    var nodes: [BSTreeNode] = []
    nodes.append(root)
    
    while nodes.count > 0 {
        let node = nodes[0]
        nodes.removeFirst()
        print(node.value)
        
        if let left = node.left {
            nodes.append(left)
        }
        if let right = node.right {
            nodes.append(right)
        }
    }
}

var root = BSTreeNode(8)
insert(root, 6)
insert(root, 5)
insert(root, 7)
insert(root, 10)
insert(root, 9)
insert(root, 11)

printTreeByLevel(root)
