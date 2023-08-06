puts 'Ruby'
Expected = 15485863
N,Findprime = 16000000, 1000000
maxprime,count,N_sqrt = 0, 1, Integer(Math::sqrt(N))
b = Array.new(N)
3.step(N_sqrt, 2) do |i|
  next if b[i]
  count += 1
  (i*i).step(N, i << 1) { |k| b[k] = true }
end
N_sqrt.succ.step(N, 2) do |i|
  next if b[i]
  maxprime = i
  count += 1
  break if count >= Findprime
end
puts "Total Primes  = #{count}"
puts "Max Prime = #{maxprime}"
puts "ERROR: Largest Prime was incorrect. Should be: #{Expected}" if maxprime != Expected
