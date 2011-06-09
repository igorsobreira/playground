#include <stdio.h>

void callback1() {
  printf("First callback\n");
}

void callback2() {
  printf("Second callback\n");
}

int main(int argc, char *argv[]) {
  
  atexit(callback2);
  atexit(callback2);
  atexit(callback1);

  printf("Leaving...\n");

  return 0;
}
