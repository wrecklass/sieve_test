package main

import (
	"fmt"
)

func main() {
	fmt.Printf("Go\n")
	const Expected int = 15485863
	const N int = 16000000
	const FINDPRIME int = 1000000
	var i, count int = 0, 1
	// var b [N]byte
	b := make([]bool, N) // b is composite.  false means prime candidate

	for i = 3; i*i <= N; i += 2 {
		if !b[i] {
			count++
			for k := i * i; k <= N; k += 2 * i {
				b[k] = true
			}
		}
	}
	for ; i <= N; i += 2 {
		if !b[i] {
			count++
			if count >= FINDPRIME {
				break
			}
		}
	}
	fmt.Printf("Total Primes = %d\n", count)
	fmt.Printf("Max Prime = %d\n", i)
	if i != Expected {
		fmt.Printf("ERROR: Largest Prime was incorrect. Should be: %v\n", Expected)
	}
}

// vim: ts=2 sw=2
