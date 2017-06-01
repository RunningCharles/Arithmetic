#!/usr/bin/swift

enum HeapType {
    case max
    case min
}
class Heap {
    var heap: [Int] = []
    var type: HeapType = .max
    
    init(_ type: HeapType) {
        self.type = type
    }
    
    func build(_ values: [Int]) {
        for value in values { insert(value) }
    }
    
    func insert(_ value: Int) {
        heap.append(value)
        update()
    }
    
    func get() -> Int {
        if heap.count == 0 { return -1 }
        
        return heap[0]
    }
    
    func delete() -> Int {
        if heap.count == 0 { return -1 }
        
        let value = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        heapify()
        
        return value
    }
    
    func update() {
        var index = heap.count - 1
        while index > 0 {
            let parent = self.parent(index)
            if type == .max && heap[parent] >= heap[index] { break }
            if type == .min && heap[parent] <= heap[index] { break }
            
            let tmp = heap[index]
            heap[index] = heap[parent]
            heap[parent] = tmp
            
            index = parent
        }
    }
    
    func heapify() {
        var index = 0
        while index < heap.count {
            let left = self.left(index)
            let right = self.right(index)
            
            var child = -1
            
            if type == .max {
                if right < heap.count && heap[right] > heap[index] && heap[right] > heap[left] {
                    child = right
                } else if left < heap.count && heap[left] > heap[index] {
                    child = left
                }
            } else {
                if right < heap.count && heap[right] < heap[index] && heap[right] < heap[left] {
                    child = right
                } else if left < heap.count && heap[left] < heap[index] {
                    child = left
                }
            }
            if child == -1 { break }
            
            let tmp = heap[index]
            heap[index] = heap[child]
            heap[child] = tmp
            
            index = child
        }
    }
    
    func parent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func left(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    func right(_ index: Int) -> Int {
        return index * 2 + 2
    }
    
    func printHeap() {
        print("heap:", heap)
    }
}

var maxHeap = Heap(.min)
maxHeap.insert(1)
maxHeap.insert(2)
maxHeap.insert(3)
maxHeap.insert(4)
maxHeap.insert(5)
maxHeap.insert(6)
maxHeap.insert(7)
maxHeap.insert(8)

maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()
print(maxHeap.delete())
maxHeap.printHeap()




