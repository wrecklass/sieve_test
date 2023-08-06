# use strict;
use integer;
print "Perl\n";
$Expected = 15485863;
my $N = 16000000; my $FINDPRIME = 1000000; my $maxprime = 0;
my $count = 1; my $i = 3; my $k = 0; my $N_sqrt = sqrt($N);
my @b = (0..$N);
for ($i = 3; $i <= $N_sqrt; $i += 2) {
    if ( defined $b[$i] ) {
        $count += 1;
        for ($k = $i * $i; $k <= $N; $k += $i * 2) {
            undef $b[$k];
        }
    }
}
for ( ; $i <= $N; $i += 2 ) {
    if (defined $b[$i]) {
        $maxprime=$i;
        $count += 1;
    }
    $i=$N + 1 if ($count >= $FINDPRIME);
}
print "Total Primes: $count\n";
print "Max Prime: $maxprime\n";
print "ERROR: Largest Prime was incorrect. Should be: $Expected\n" if ($maxprime != $Expected);
