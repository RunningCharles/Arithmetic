#!/usr/bin/swift

struct MinStackElement {
    var value: Int!
    var min: Int!
    
    init(_ value: Int, _ min: Int) {
        self.value = value
        self.min = min
    }
}

class MinStack {
    var stack:[MinStackElement] = []
    
    func push(_ value: Int) {
        var minValue = value
        if let top = stack.last {
            minValue = min(top.min, minValue)
        }
        stack.append(MinStackElement(value, minValue))
    }
    
    func pop() -> Int? {
        guard let top = stack.last else {
            return nil
        }
        stack.removeLast()
        return top.value
    }
    
    func minValue() -> Int? {
        guard let top = stack.last else {
            return nil
        }
        return top.min
    }
}

extension MinStack: CustomStringConvertible {
    var description: String {
        var minValue: Any = "nil"
        if let top = stack.last {
            minValue = top.min
        }
        return "count: \(stack.count), min: \(minValue)"
    }
}

var minStack = MinStack()
minStack.push(2)
minStack.push(3)
minStack.push(1)
print(minStack.pop() as Any)
print(minStack)



