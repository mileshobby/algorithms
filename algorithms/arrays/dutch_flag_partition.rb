def dutch_flag_partition(arr, pivot_i)
  pivot = arr[pivot_i]
  low = 0
  mid = 0
  high = arr.length
  while mid < high
    if arr[mid] < pivot
      arr[mid], arr[low] = arr[low], arr[mid]
      low += 1
      mid += 1
    elsif arr[mid] > pivot
      high -= 1
      arr[mid], arr[high] = arr[high], arr[mid]
    else
      mid += 1
    end
  end
  arr

end

p dutch_flag_partition([5,4,3,6,7,5,4,2,1],0)
