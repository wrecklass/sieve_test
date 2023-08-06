fn main() {
    println!("Rust");
    const EXPECTED: usize = 15485863;
    const FLOT: f64 = 16000000_f64;
    const N: usize = 16000000;
    const FINDPRIME: usize = 1000000;
    let n_sqrt: usize = FLOT.sqrt() as usize + 1;
    let mut count: usize = 1;
    let mut b = vec![0u8; 16000000];
    let mut i: usize = 3;
    let mut k: usize;

    while i <= n_sqrt {
        if b[i] == 0 {
            count += 1;
            k = i;
            while k <= N {
                b[k] = 1;
                k = k + (2 * i);
            }
        }
        i = i + 2;
    }

    while i <= N {
        if b[i] == 0 {
            count += 1;
            if count >= FINDPRIME {
                break;
            }
        }
        i = i + 2;
    }
    println!("Total Primes = {}", count);
    println!("Max Prime = {}", i);
    if i != EXPECTED {
        println!(
            "ERROR: Largest Prime was incorrect. Should be: {}",
            EXPECTED
        )
    }
}
