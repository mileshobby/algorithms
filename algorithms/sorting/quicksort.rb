def quicksort_in_place(arr, lo = 0, hi = arr.length - 1)
  return if lo >= hi
  i = partition(arr, lo, hi)
  quicksort_in_place(arr, lo, i - 1)
  quicksort_in_place(arr, i + 1, hi)
end

def partition(arr, lo, hi)
  idx = rand(lo..hi)
  pivot = arr[idx]
  arr[idx], arr[hi] = arr[hi], arr[idx]
  barrier = lo
  lo.upto(hi - 1) do |i|
    if arr[i] < pivot
      arr[i], arr[barrier] = arr[barrier], arr[i]
      barrier += 1
    end
  end
  pivot_i = barrier + 1
  arr[hi], arr[pivot_i] = arr[pivot_i], arr[hi]
  pivot_i
end

def quicksort(arr)
  return arr if arr.length <= 1
  pivot = arr[0]
  left = arr[1..-1].select { |el| el <= pivot}
  right = arr[1..-1].select { |el| el > pivot}
  quicksort(left) + [pivot] + quicksort(right)
end
ar = [5,4,6,7,2,1,19,8,3]
p ar
p quicksort([5,4,6,7,2,1,19,8,3])
