def permutations(arr)
  return [[]] if arr.empty?
  pivot = [arr[0]]
  last_perms = permutations(arr.drop(1))
  this_perms = []
  last_perms.each do |perm|
    (0..perm.length).each do |i|
      this_perms << perm[0...i] + pivot + perm[i..-1]
    end
  end
  this_perms
end

p permutations([1,2,3])
