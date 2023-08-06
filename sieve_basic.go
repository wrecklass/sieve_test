package main

import "fmt"

func main() {
	const Limit = 16000000 // 15485863
	const MAXCNT = 1000000
	n := 1
	count := 0
	fmt.Println("Go")

	// sieve
	c := make([]bool, Limit) // c for composite.  false means prime candidate
	c[1] = true              // 1 not considered prime
	p := 2
	for {
		// first allowed optimization:  outer loop only goes to sqrt(Limit)
		p2 := p * p
		if p2 >= Limit {
			break
		}
		// second allowed optimization:  inner loop starts at sqr(p)
		for i := p2; i < Limit; i += p {
			c[i] = true // it's a composite
		}
		// scan to get next prime for outer loop
		for {
			p++
			if !c[p] {
				break
			}
		}
	}

	// sieve complete.  now sum them up
	for n = 1; n < Limit; n++ {
		if !c[n] {
			count++
			if count >= MAXCNT {
				break
			}
		}
	}
	fmt.Printf("Total Primes: %d\n", count)
	fmt.Printf("Max Prime: %d\n", n)
}

// vim: ts=2 sw=2
