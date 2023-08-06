using System.Collections;
class Sieve {
  static public void Main() {
    System.Console.WriteLine("C# (MS C Sharp)");
    const int Expected = 15485863;
    int count = 1; int i;
    const int N = 16000000; const int FINDPRIME = 1000000;
    int N_sqrt = (int) System.Math.Sqrt(N);
    BitArray b = new BitArray(N+1);
    for (i = 3; i <= N_sqrt; i += 2) {
      if ( b.Get(i) ) continue;
      count++;
      for (int k = i*i; k <= N; k += 2 * i) b.Set(k,true);
    }
    while ( i <= N ) {
      if ( ! b.Get(i) ) count++;
      if (count >= FINDPRIME) break;
      i += 2;
    }
    System.Console.WriteLine("Total Primes = " + count);
    System.Console.WriteLine("Max Prime = " + i);
    if (i != Expected) System.Console.WriteLine("ERROR: Largest Prime was incorrect. Should be: " + Expected);
  }
}
