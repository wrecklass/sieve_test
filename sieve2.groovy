import java.util.BitSet
import static java.lang.Math.sqrt
import static java.lang.System.out

System.out.println("Groovy")

int Expected  = 15485863
int N         = 16000000
int FINDPRIME = 1000000
int count     = 1
int i         = 3
int N_sqrt    = sqrt(N)
BitSet b = new BitSet(N)

for (i = 3; i <= N_sqrt; i += 2) if ( ! b.get(i) ) {
  count++
  for (k = i*i; k <= N; k += 2 * i) b.set(k)
}

for (; i <= N ; i += 2) if ( ! b.get(i) ) {
  count++
  if (count >= FINDPRIME) break
}

out.println("Total Primes = " + count)
out.println("Max Prime = " + i )
if (i != Expected) out.println("ERROR: Largest Prime was incorrect. Should be: " + Expected)

