#!/usr/bin/swift

let arr = [1, -2, 3, 10, -4, 7, 2, -5]

func maxSubArray(_ arr: [Int]) -> (Int, [Int]) {
    var max = (-Int.max - 1)
    var first = 0
    var last = 0
    var ft = 0
    var lt = 0
    var sum = 0
    for index in 0..<arr.count {
        sum += arr[index]
        lt = index
        if sum > max {
            max = sum
            first = ft
            last = lt
        }
        if sum < 0 {
            sum = 0
            ft = index + 1
        }
    }
    return (max, Array(arr[first...last]))
}

print(maxSubArray(arr))
