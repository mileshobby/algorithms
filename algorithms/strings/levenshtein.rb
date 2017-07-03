# number of instertions, deletions, letter subs to make a word from another

def levenshtein_distance(str1, str2)
  matrix = Array.new(str1.length + 1) { Array.new(str2.length + 1) }
  #initialize first column and first row
  0.upto(str1.length) do |i|
    matrix[i][0] = i
  end
  0.upto(str2.length) do |j|
    matrix[0][j] = j
  end

  1.upto(str2.length) do |i|
    1.upto(str1.length) do |j|
      letter_diff = str1[i - 1] == str2[j - 1] ? 0 : 1
      matrix[j][i] = [matrix[j][i - 1] + 1,
                      matrix[j - 1][i] + 1,
                      matrix[j-1][i-1] + letter_diff].min
    end
  end
  matrix[-1][-1]

end

p levenshtein_distance("hello", "hal")
