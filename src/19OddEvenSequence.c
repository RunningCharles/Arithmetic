#include <stdio.h>
#include <string.h>

void swap(int *values, int i, int j) {
    if (i == j) { return; }
    int tmp = values[i];
    values[i] = values[j];
    values[j] = tmp;
}

void oddEven(int *values, int len) {
    int oddIndex = 0;
    int evenIndex = len - 1;
    int index = oddIndex;
    while (index <= evenIndex) {
        if (oddIndex > index) {
            index = oddIndex;
            continue;
        }
        if (values[index] %2 == 1) {
            swap(values, oddIndex, index);
            oddIndex += 1;
        } else {
            swap(values, evenIndex, index);
            evenIndex -= 1;
        }
    }
}

void printArray(int *values, int len) {
    printf("values: [");
    for (int i = 0; i < len; ++i) {
        if (i != 0) { printf(", "); }
        printf("%d", values[i]);
    }
    printf("]\n");
}

int main() {
    int values[] = {4,1,5,6,7,2,9,2,5,8,9,1,5,8,32,5,7,31,7,6,234,6,32};
    int len = sizeof(values)/sizeof(int);
    printArray(values, len);
    oddEven(values, len);
    printArray(values, len);
}
