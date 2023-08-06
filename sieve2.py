import math
print ( 'Python' )
Expected = 15485863
N, FINDPRIME = 16000000,1000000
count, N_sqrt = 1, int(math.sqrt(N))
b = []
for s in range(0,N):
  b.append(1)
for i in range(3, N_sqrt, 2):
  if b[i]:
    count = count + 1
    for k in range((i*i), N, i*2):
      b[k] = 0
for i in range(i, N, 2):
  if b[i]:
    count += 1
  if count >= FINDPRIME:
    break
print ( 'Total Primes = ', count )
print ( 'Max Primes = ', i )
if (i != Expected):
  print ( "ERROR: Largest Prime was incorrect. Should be: ", Expected )
