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

func handler(_ root: BSTreeNode, _ sum: Int, _ path: [Int]) {
    var path = path
    path.append(root.value)
    let sum = sum - root.value
    
    if root.leftNode == nil && root.rightNode == nil {
        if sum == 0 { print("path: ", path) }
    }
    
    if let leftNode = root.leftNode {
        handler(leftNode, sum, path)
    }
    
    if let rightNode = root.rightNode {
        handler(rightNode, sum, path)
    }
}

func printSumPath(_ root: BSTreeNode, _ sum: Int) {
    let path: [Int] = []
    handler(root, sum, path)
}

var root = BSTreeNode(10)
insertTree(root, 5)
insertTree(root, 4)
insertTree(root, 7)
insertTree(root, 12)

printTree(root)

print("===========")


printSumPath(root, 22)
