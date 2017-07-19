def check_inclusion(s1, s2)
    hash = Hash.new { |h, k| h[k] = 0 }
    s1.chars.each {|c| hash[c] += 1}
    s2.chars.each {|c| hash[c] -= 1 if hash[c] > 0 }
    p hash
    hash.values.all? {|count| count == 0}
end
