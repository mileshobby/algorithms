require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  counts = HashMap.new
  string.each_char do |char|
    if counts[char]
      counts[char] += 1
    else
      counts[char] = 1
    end
  end
  found_odd_before = false
  counts.each do |char, count|
    if count.odd?
      return false if found_odd_before
      found_odd_before = true
    end
  end
  true
end
