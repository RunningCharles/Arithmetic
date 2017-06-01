#include <stdio.h>
#include <string.h>

void swap(char *str, int i, int j) {
    char tmp = str[i];
    str[i] = str[j];
    str[j] = tmp;
}

void reverse(char *str, size_t n) {
    int left = 0;
    int right = n - 1;
    while (left < right) {
        swap(str, left, right);
        ++left;
        --right;
    }
}

void rotate(char *str, size_t n, size_t k) {
    if (n <= k || k <= 0) { return; }
    
    if (n >= k * 2) {
        for (int i = 0; i < k; ++i) {
            swap(str, i, k + i);
        }
        rotate(str+k, n - k, k);
    } else {
        reverse(str, n);
        rotate(str, n, n - k);
        reverse(str, n);
    }
}


int main() {
    char str[] = "abcdefghijklmn";
    printf("str: %s\n", str);
    rotate(str, strlen(str), 3);
    printf("result: %s\n", str);
}
