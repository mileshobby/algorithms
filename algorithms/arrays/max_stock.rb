#given an array of stock prices, calculate max profit you can make
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

def two_max_stocks(arr)
  forward = []
  max_diff = 0
  min = arr[0]
  arr.each do |price|
    min = price if min > price
    max_diff = price - min if max_diff < price - min
    forward << max_diff
  end

  reverse = []
  max = arr[-1]
  max_diff = 0
  best_profit =  max_diff
  arr.reverse.each_with_index do |price, i|
    max = price if max < price
    this_profit = max + (forward[i] - price)
    best_profit = this_profit if this_profit > best_profit
  end
  best_profit

end

p two_max_stocks([12,11,13,9,12,8,14,13,15])
