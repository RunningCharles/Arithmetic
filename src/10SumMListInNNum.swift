#!/usr/bin/swift

func printList(_ m: Int, _ n: Int , _ list: inout [Int]) {
    if m == 0 && list.count > 0 {
        print(list)
        return
    }
    
    if m <= 0 || n <= 0 { return }
    
    var list1 = list.map { $0 }
    printList(m, n - 1, &list)
    
    list1.append(n)

    printList(m - n, n - 1, &list1)
}

var list:[Int] = []
printList(8, 10, &list)
