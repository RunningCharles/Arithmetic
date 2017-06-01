#!/usr/bin/swift

class Stack {
    var values: [Int] = []
    
    func push(_ value: Int) {
        values.append(value)
    }
    
    func peek() -> Int {
        if values.count == 0 { return -1 }
        
        return values[values.count - 1]
    }
    
    func pop() -> Int {
        if values.count == 0 { return -1 }
        
        let value = values[values.count - 1]
        values.removeLast()
        return value
    }
    
    func isEmpty() -> Bool {
        return values.count == 0
    }
}

func isPopOrder(_ push: [Int], _ pop: [Int]) -> Bool {
    if push.count == 0 || pop.count == 0 || push.count != pop.count {
        return false
    }
    
    let stack = Stack()
    var pushIndex = 0
    var popIndex = 0
    
    while popIndex < pop.count {
        while pushIndex < push.count && (stack.isEmpty() || stack.peek() != pop[popIndex]) {
            stack.push(push[pushIndex])
            pushIndex += 1
        }
        
        if stack.peek() == pop[popIndex] {
            stack.pop()
            popIndex += 1
        } else {
            return false
        }
    }
    return true
}

print(isPopOrder([4,5,3,2,1], [4,3,5,1,2]))
