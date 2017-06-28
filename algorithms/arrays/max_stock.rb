def max_stock(arr)
  min = arr[0]
  max_diff = 0
  arr.each do |el|
    min = el if min > el
    max_diff = el - min if max_diff < el - min
  end
  max_diff
end

p max_stock([310,315,275,295,260,270,290,230,255,250])
