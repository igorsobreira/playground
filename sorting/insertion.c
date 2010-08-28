/*
 * Insertion sorting
 */
#include <stdio.h>

void sort(int numbers[], int length) {
    int i, j, tmp;

    for (i = 1; i < length; i++) {
        tmp = numbers[i];
        for (j = i; j > 0 && tmp < numbers[j-1]; j--) {
            numbers[j] = numbers[j-1];
        }
        numbers[j] = tmp;
    }
}

void assert_array(int expected[], int received[], int length) {
    int i;

    for (i = 0; i < length && expected[i] != received[i]; i++) {
        printf("ASSERT FAILED: sort() function is wrong\n");
        break;
    }
}

int main() {
    
    int numbers[5] = {6, 2, 9, 4, 3};
    int expected[5] = {2, 3, 4, 6, 9};
    int length = 5;
    int i;

    sort(numbers, length);
    assert_array(expected, numbers, length);
     
    return 0;
}
