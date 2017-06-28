#given an input array, if you can move up to arr[i] steps at each index, is it possible to reach the end?
def can_reach_end?(arr)
  furthest = 0
  i = 0
  while i <= furthest && furthest < arr.length - 1
    furthest = [furthest, arr[i] + i].max
    i += 1
  end
  furthest >= arr.length - 1
end

p can_reach_end?([3,3,1,0,2,0,1]) #true
p can_reach_end?([3,2,0,0,2,0,1]) #false
