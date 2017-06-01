#!/usr/bin/swift

func swap(_ values: inout [Int], _ i: Int, _ j: Int) {
    if i == j { return }
    
    let tmp = values[i]
    values[i] = values[j]
    values[j] = tmp
}

func quickSelect(_ values: inout [Int], _ k: Int, _ left: Int, _ right: Int) {
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
    
    let kt = index + 1 - left
    
    if kt == k { return }
    else if kt > k { quickSelect(&values, k, left, index - 1) }
    else { quickSelect(&values, k - kt, index + 1, right) }
}

func minKNum(_ values: [Int], _ nunberOfMin: Int) -> [Int] {
    if nunberOfMin >= values.count { return values }
    
    var tmp = values.map { $0 }
    quickSelect(&tmp, nunberOfMin, 0, tmp.count - 1)
    
    return Array(tmp[0 ... (nunberOfMin - 1)])
}

var values  = [3,7,8,5,2,1,9,5,4]
print("values:", values)
var result = minKNum(values, 4)
print("result:", result)
