#!/usr/bin/swift

class BSTreeNode {
    var value: Int!
    var leftNode: BSTreeNode?
    var rightNode: BSTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

func insertTree(_ root: BSTreeNode?, _ value: Int) {
    guard let root = root else { return }
    if value == root.value { return }
    
    if value < root.value {
        guard let leftNode = root.leftNode else {
            root.leftNode = BSTreeNode(value)
            return
        }
        insertTree(leftNode, value)
    } else {
        guard let rightNode = root.rightNode else {
            root.rightNode = BSTreeNode(value)
            return
        }
        insertTree(rightNode, value)
    }
}

func printTree(_ root: BSTreeNode?) {
    guard let root = root else { return }
    printTree(root.leftNode)
    print(root.value)
    printTree(root.rightNode)
}

func handler(_ root: BSTreeNode?, _ head: inout BSTreeNode?, _ tail: inout BSTreeNode?) {
    guard let root = root else {
        head = nil
        tail = nil
        return
    }
    
    var left: BSTreeNode? = nil
    var right: BSTreeNode? = nil
    
    handler(root.leftNode, &head, &left)
    handler(root.rightNode, &right, &tail)
    
    if let left = left {
        root.leftNode = left
        left.rightNode = root
    } else {
        head = root
    }
    
    if let right = right {
        root.rightNode = right
        right.leftNode = root
    } else {
        tail = root
    }
}

func treeToLinkedList(_ root: BSTreeNode?) -> BSTreeNode? {
    guard let root = root else { return nil }
    
    var head: BSTreeNode? = nil
    var tail: BSTreeNode? = nil
    
    handler(root, &head, &tail)
    
    return head
}

func printLinkedList(_ head: BSTreeNode?) {
    guard let head = head else { return }
    print(head.value)
    printLinkedList(head.rightNode);
}

var root = BSTreeNode(10)
insertTree(root, 6)
insertTree(root, 4)
insertTree(root, 8)
insertTree(root, 14)
insertTree(root, 12)
insertTree(root, 16)

printTree(root)

print("=============")

var head = treeToLinkedList(root)

printLinkedList(head)
