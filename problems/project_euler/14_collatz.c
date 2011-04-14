#include <stdio.h>

unsigned int seqnext(unsigned int n) {
    if (n % 2 == 0)
        return n/2;
    return 3*n + 1;
}

unsigned int seqlen(unsigned int n) {
    unsigned int len = 1;
    while (n != 1) {
        n = seqnext(n);
        len++;
    }
    return len;
}

int main(int argc, const char *argv[])
{
    unsigned int max = 1;
    unsigned int number = 1;
    unsigned int len, i;

    for (i=1; i<1000000; i++) {
        len = seqlen(i);
        if (len > max) {
            max = len;
            number = i;
        }
    }

    printf("%d\n", number);

    if (number != 837799)
        fprintf(stderr, "Fail. Result should be 837799\n");

    return 0;
}
