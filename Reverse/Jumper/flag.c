#include <stdio.h>

int main(void) {
  char s[4] = "jum";
  int* tmp = (int*)s;

  for (int i = 0; i <= 7; i++) {
    *tmp += 5;
  }

  printf("Address: 0x%08X\n", *tmp);

  return 0;
}