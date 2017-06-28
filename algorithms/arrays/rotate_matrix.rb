def rotate_matrix(arr)
  rotated = Array.new(arr[0].length) {Array.new(arr.length)}
  0.upto(arr.length - 1) do |i|
    0.upto(arr[0].length - 1) do |j|
      rotated[j][i] = arr[i][j]
    end
  end
  rotated
end

p rotate_matrix([[1,2,3],[4,5,6]])
