#include <stdio.h>
#include <string.h>

void swap(char *perm, int i, int j) {
    if (i == j) { return; }
    char tmp = perm[i];
    perm[i] = perm[j];
    perm[j] = tmp;
}

void printAllPermutation (char *perm, int from, int to) {
    if (from == to) {
        printf("%s\n", perm);
        return;
    }
    
    for (int i = from; i <= to; ++i) {
        swap(perm, from, i);
        printAllPermutation(perm, from + 1, to);
        swap(perm, from, i);
    }
}

int main () {
    char perm[] = "abcd";
    printAllPermutation(perm, 0, strlen(perm) - 1);
}
