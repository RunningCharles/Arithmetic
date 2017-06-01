#!/usr/bin/swift

func sum(_ arr: [Int]) -> Int {
    var sum = 0
    for item in arr {
        sum += item
    }
    return sum
}

func minDiff(_ a: inout [Int], _ b: inout [Int]) {
    let sumA = sum(a)
    let sumB = sum(b)
    
    if sumA == sumB { return }
    var big = a
    var small = b
    if sumB > sumA {
        big = b
        small = a
    }
    
    let diff = abs(sumA - sumB)
    var pi = -1
    var pj = -1
    var maxDiff = Int.max
    for i in 0 ..< big.count {
        for j in 0 ..< small.count {
            if big[i] > small[j] {
                let tmpDiff = abs(diff - 2 * (big[i] - small[j]))
                if tmpDiff < maxDiff && tmpDiff < diff {
                    pi = i
                    pj = j
                    maxDiff = tmpDiff
                }
            }
        }
    }
    
    if pi >= 0 && pj >= 0 {
        let tmp = big[pi]
        big[pi] = small[pj]
        small[pj] = tmp
        
        a = big
        b = small
        minDiff(&a, &b)
    }
}

var a = [100, 99, 98, 1, 2, 3];
var b = [1, 2, 3, 4, 5, 40];

minDiff(&a, &b)

print("a:", a)
print("b:", b)
