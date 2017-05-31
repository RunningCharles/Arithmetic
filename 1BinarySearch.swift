#!/usr/bin/swift

func binarySearch(_ key: Int, _ array: [Int]) -> Int {
    var left = 0
    var right = array.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if array[mid] == key { return mid }
        else if array[mid] < key { left = mid + 1 }
        else { right = mid - 1 }
    }
    return -1
}

let arr = [1,3,4,5,6,9,23,44,55,79,133,447]

let index = binarySearch(79 , arr)

print(index)
