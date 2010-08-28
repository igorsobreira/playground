/*
 * Selection 
 */

#include <stdio.h>

void assert_array(int expected[], int received[], int length) {
    int i;

    for (i = 0; i < length && expected[i] != received[i]; i++) {
        printf("ASSERT FAILED: sort() function is wrong\n");
        break;
    }
}

void sort(int numbers[], int length) {
    int i,j,tmp;
    int least = 0;

    for (i = 0; i < length-1; i++) {
        least = i;
        for (j = i+1; j < length; j++) {
            if (numbers[j] < numbers[least]) {
                least = j;
            }
        }
        tmp = numbers[i];
        numbers[i] = numbers[least];
        numbers[least] = tmp;
    }
} 

int main() {
    
    int numbers[5] = {6,3,8,2,7};
    int expected[5] = {2,3,6,7,8};
    int length = 5;
   
    sort(numbers, length);
    assert_array(expected, numbers, length);

    return 0;
}
