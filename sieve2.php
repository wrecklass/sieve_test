<?php
print "PHP\n";
$Expected = 15485863;
$N = 16000000; $FINDPRIME = 1000000;
$count = 1; $N_sqrt = sqrt($N);
$b = array();
for ($i = 3; $i < $N; $i += 2) $b[$i] = 1;
for ($i = 3; $i <= $N_sqrt; $i += 2) {
    if ($b[$i] == 0) continue;
    $count++;
    for ( $k = $i*$i;$k <= $N ; $k += 2*$i) $b[$k] = 0;
}
for (;$i <= $N; $i += 2) {
    if ($b[$i] == 0) continue;
    $count++;
    if ($count >= $FINDPRIME) break;
}
print "Total Primes  = $count\n";
print "Max Prime = $i\n";
if ($i != $Expected) print "ERROR: Largest Prime was incorrect. Should be: $Expected\n";
?>

