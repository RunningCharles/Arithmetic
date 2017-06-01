#!/usr/bin/swift

func swap(_ values: inout [Int], _ i: Int, _ j: Int) {
    if i == j { return }
    
    let tmp = values[i]
    values[i] = values[j]
    values[j] = tmp
}

func quickSort(_ values: inout [Int], _ left: Int, _ right: Int) {
    if left >= right { return }
    
    let pivot = values[right]
    var index = left
    
    for i in left ..< right {
        if values[i] < pivot {
            swap(&values, index, i)
            index += 1
        }
    }
    swap(&values, index, right)
    
    quickSort(&values, left, index - 1)
    quickSort(&values, index + 1, right)
}

var values  = [3,7,8,5,2,1,9,5,4]

print("start:", values)
quickSort(&values, 0, values.count - 1)
print("end:", values)
