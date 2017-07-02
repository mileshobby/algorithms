def is_permutation?(str1, str2)
  chars = Hash.new {|h,k| h[k] = 0}
  str1.each_char { |c| chars[c] += 1}
  str2.each_char { |c| chars[c] -= 1}
  chars.values.all? { |v| v == 0}
end

p is_permutation?("hello", "ollht")
p is_permutation?("hello", "ollhe")
