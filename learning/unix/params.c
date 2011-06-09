#include <stdio.h>

int main(int argc, char *argv[]) {
  int i;

  // both ISO C and POSIX.1 guarantee that
  // argv[argc] is a NULL pointer

  for (i = 0; argv[i] != NULL; i++) {
    printf("%s\n", argv[i]);
  }

  return 0;
}
