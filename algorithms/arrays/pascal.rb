def pascal(n)
  i = 0
  rows = Array.new(n).map{| _ | Array.new(i += 1) {1}}
  1.upto(n - 1) do |i|
    1.upto(i-1) do |j|
      rows[i][j] = rows[i-1][j-1] + rows[i-1][j]
    end
  end
  rows
end

p pascal(5)
