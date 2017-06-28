#return an array of all prime numbers from 2...n
def primes(n)
  #no need to test beyond sqrt n
  prime_nums = []
  is_prime = Array.new(n) {true}
  is_prime[0], is_prime[1] = false, false
  is_prime.each_with_index do |num, i|
    next unless num
    prime_nums << i
    j = 2
    until j * i > is_prime.length - 1
      is_prime[j * i] = false
      j += 1
    end
  end
  prime_nums
end

p primes(18)
