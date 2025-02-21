#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE *fp = popen("getprop ro.product.model", "r");
  if (fp == NULL) return 1;

  char model[0xff+1];
  int status = -1;
  if (fgets(model, sizeof(model), fp)) {
    status = 0;
    printf("Hello NDK! I'm running on %s\n", model);
  }
  pclose(fp);
  return status;
}
