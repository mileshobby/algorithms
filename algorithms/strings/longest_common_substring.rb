def longest_common_substring(str1, str2)
  lengths = Array.new(str1.length + 1) { Array.new(str2.length + 1)}
  max = ""
  0.upto(str1.length) do |i|
    0.upto(str2.length) do |j|
      lengths[i][j] = 0 if i == 0 || j == 0
      if str1[i - 1] == str2[j - 1]
        lengths[i][j] = lengths[i - 1][j - 1] + 1
        max = str1[i - lengths[i][j] - 1..i] if lengths[i][j] > max.length
      else
        lengths[i][j] = 0
      end
    end
  end
  max
end

p longest_common_substring("hello", "thelre")
