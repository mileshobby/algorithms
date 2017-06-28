def random_subset(arr, k)
  return [] if k == 0
  pivot_i = rand(arr.length)
  [arr[pivot_i]] + random_subset(arr[0...pivot_i] + arr[pivot_i + 1...-1], k-1)
end

p random_subset([1,2,3,4,5,6,7,8,9], 3)
