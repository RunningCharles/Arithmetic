#include <stdio.h>

int numberOf1InBinary(int n) {
    int c = 0;
    if (n < 0) { c++; n = -n; }
    
    while (n > 0) {
        c += 1 & n;
        n >>= 1;
    }
    
    return c;
}

int main() {
    int count = numberOf1InBinary(0xff - 1);
    printf("%d\n", count);
}
