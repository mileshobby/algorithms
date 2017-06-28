class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = array.drop(1).select { |el| el <= pivot}
    right = array.select { |el| el > pivot}
    QuickSort.sort1(left) + [ pivot ] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)

    QuickSort.sort2!(array, start, left_length, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|a,b| a <=> b}
    pivot = array[start]
    partition_idx = start
    pivot_idx = start
    ((start+1)...(start + length)).each do |idx|
      if prc.call(array[idx], pivot) < 0
        array[idx], array[partition_idx] = array[partition_idx], array[idx]
        if partition_idx == pivot_idx
          pivot_idx = idx
        end
        partition_idx += 1
      end
    end
    array[pivot_idx], array[partition_idx] = array[partition_idx], array[pivot_idx]
    partition_idx
  end
end

QuickSort.sort1([1,3,4,2,4,0])
