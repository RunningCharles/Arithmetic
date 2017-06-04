#!/usr/bin/swift

func maxDecreasingSequence(_ values: [Int], _ table: inout [Int]) -> Int {
    var maxLen = 0
    for i in (0 ..< values.count).reversed() {
        var maxLenTmp = 0
        for j in (i + 1) ..< values.count {
            if (values[i] > values[j]) {
                maxLenTmp = max(maxLenTmp, table[j])
            }
        }
        
        table[i] = maxLenTmp + 1
        maxLen = max(maxLen, table[i])
    }
    
    return maxLen
}

let values = [9, 4, 3, 2, 5, 4, 3, 2]
var table: [Int] = values.map { $0 * 0 }

let maxLen = maxDecreasingSequence(values, &table)
var ml = maxLen
var lv = Int.max
var maxDS: [Int] = []
for i in 0 ..< table.count {
    if ml == table[i] && values[i] < lv {
        maxDS.append(values[i])
        lv = values[i]
        ml -= 1
    }
}

print("values:", values)
print("table:", table)
print("maxDS:", maxDS)

