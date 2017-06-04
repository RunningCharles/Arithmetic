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

func maxDistance(_ root: BSTreeNode?, _ depth: inout Int) -> Int {
    guard let root = root else { return 0 }
    
    var ld = 0, rd = 0
    let mldis = maxDistance(root.leftNode, &ld)
    let mrdis = maxDistance(root.rightNode, &rd)
    depth = max(ld, rd) + 1
    return max(mldis, max(mrdis, ld+rd))
}

var root = BSTreeNode(10)
insertTree(root, 6)
insertTree(root, 4)
insertTree(root, 8)
insertTree(root, 14)
insertTree(root, 12)
insertTree(root, 16)
insertTree(root, 18)

var depth = 0
print("maxDistance:", maxDistance(root, &depth))
