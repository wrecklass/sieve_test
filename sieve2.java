import java.util.BitSet;
import static java.lang.Math.sqrt;
import static java.lang.System.out;

public class sieve2 {

  public static void main(String[] s) {
    out.println("Java");
    int count = 1, i = 3;
    int N_sqrt = (int)sqrt((double)N);
    BitSet b = new BitSet(N);

    for (i = 3; i <= N_sqrt; i += 2) {
      if ( ! b.get(i) ) {
        count++;
        for (int k = i*i; k <= N; k += 2 * i) b.set(k);
      }
    }
    for (;i <= N; i += 2) {
      if ( ! b.get(i) ) {
        count++;
        if (count >= FINDPRIME) break;
      }
    }
    out.println("Total Primes = " + count);
    out.println("Max Prime = " + i);
    if (i != Expected) out.println("ERROR: Largest Prime was incorrect. Should be: " + Expected);
  }

  static final int N = 16000000;
  static final int FINDPRIME = 1000000;
  static final int Expected = 15485863;
}
