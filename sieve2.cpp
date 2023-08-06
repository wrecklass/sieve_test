#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int main() {
  printf("CPP (GNU c++)\n");
  const int Expected = 15485863;
  const int N = 16000000; const int FINDPRIME = 1000000;
  const int N_sqrt = (int) sqrt((double)N);
  int count = 1;
  int i;
  unsigned char *b = (unsigned char*)calloc(N, sizeof(char));
  for (i = 3; i <= N_sqrt; i += 2) {
    if ( b[i] ) continue;
    count++;
    for (int k = i*i; k <= N; k += 2 * i) b[k]=1;
  }
  for (; i <= N; i += 2) {
    if ( ! b[i] ) {
      count++;
    }
    if (count >= FINDPRIME) break;
  }
  printf("Total Primes = %d\n", count);
  printf("Max Prime = %d\n", i);
  if (i != Expected) printf("ERROR: Largest Prime was incorrect. Should be: %d\n", Expected);
}
