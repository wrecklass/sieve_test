#!/bin/bash

echo "Bash shell"
#declare -i N=8000000
declare -i  N=100000
#declare -i FINDPRIME=500000
declare -i FINDPRIME=25000
declare -i count=1
declare -i maxprime=0
#declare -i N_sqrt=2828
declare -i N_sqrt=10
declare -a b
#$b = array();
for ((i = 1; i < N; i++))
do
    b[$i]=1;
done


for ((i = 3; i <= N_sqrt; i += 2))
do
    if [ "${b[$i]}" -eq "1" ];then
        ((count++))
        ((k = i * i));
        while ((k <= N)); do
            b[$k]=0
            ((k += 2 * $i))
        done
    fi
done

for ((n=0; i <= N; i += 2))
do
    if [ "${b[$i]}" -eq "1" ]; then
        ((maxprime = i))
        ((count++))
    fi
    if (( count >= $FINDPRIME )); then
        break
    fi
done

echo "Total Primes  = $count"
echo "Max Prime = $maxprime"
