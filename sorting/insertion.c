/*
 * Insertion sorting
 */
#include <stdio.h>

int main() {
    
    int numbers[5] = {6, 2, 9, 4, 3};
    int length = 5;
    int i, j, tmp;

    for (i = 1; i < length; i++) {
        tmp = numbers[i];
        for (j = i; j > 0 && tmp < numbers[j-1]; j--) {
            numbers[j] = numbers[j-1];
        }
        numbers[j] = tmp;
    }

    for (i = 0; i < length; i++) {
        printf("%d ", numbers[i]);
    }
    printf("\n");

    return 0;
}
