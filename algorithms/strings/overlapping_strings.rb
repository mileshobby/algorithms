def concat(str1, str2)
  str_builder = []
  len_diff = str1.length - str2.length
  first = 0
  last = str2.length - 1
  if len_diff > 0
    first = len_diff
  elsif len_diff < 0
    last += len_diff
  end
  while first <= last
    same = true
    (last - first).times do
      if str1[first...-1] == str2[0...last]
        return str1 + str2[last..-1]
      else
        first += 1
        last -= 1
      end
    end
  end
  str1 + str2
end

p concat("miles", "fless")
