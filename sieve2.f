program sieve_2

  implicit none
  integer, parameter :: i_max = 15485866
  integer, parameter :: i_expect = 15485863
  integer :: i
  integer :: ccount
  integer :: max_prime
  logical, dimension (i_max) :: is_prime

  print *, "Fortran"
  ccount = 1
  is_prime = .true.
  is_prime (1) = .false.
  is_prime (4 : i_max : 2) = .false.
  do i = 3, int (sqrt (real (i_max))), 2
    if (is_prime (i)) is_prime (i * i : i_max : 2 * i) = .false.
    if (is_prime (i)) ccount = ccount + 1
  end do
  do i = int (sqrt (real (i_max))), i_max
    if (is_prime (i)) ccount = ccount + 1
    if (is_prime (i)) max_prime = i
  end do
  print *, "Total Primes = ", ccount
  print *, "Max Prime = ", max_prime

  if (max_prime .ne. i_expect) print *,"Error: expected prime: ", i_expect

end program sieve_2

