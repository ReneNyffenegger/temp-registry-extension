// #include <windows.h>
#include <stdio.h>

int main(int c, char* v[]) {

   printf(v[0]); printf("\n");

   for (int i = 1; i<c; i++) {
      printf("  arg %d: %s\n", i,  v[i]);
   }

}
