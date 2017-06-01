#!/usr/bin/swift

func numberOf1FromN(_ n: Int) -> Int {
    var currentN = n
    var mult = 1
    var cnt = 0
    while currentN > 0 {
        let quo = currentN / 10
        let rem = currentN % 10
        
        cnt += quo * mult
        if rem > 1 {
            cnt += mult
        } else if rem == 1 {
            cnt += n - currentN * mult + 1
        }
        
        currentN = currentN / 10
        mult *= 10
    }
    
    return cnt
}

print(numberOf1FromN(20))
