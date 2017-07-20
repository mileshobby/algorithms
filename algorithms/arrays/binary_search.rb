def binary_search(arr, target)
  p arr
  return nil if arr.empty?
  mid = arr.length / 2
  if arr[mid] == target
    mid
  elsif target < arr[mid]
    binary_search(arr[0..mid - 1], target)
  else
    val = binary_search(arr[mid + 1..-1], target)
    val.nil? ? nil : (val + mid + 1)
  end
end

# p binary_search([1,2,4, 7, 12, 3], 2)
p binary_search([1,2,4, 7, 9, 12, 15], 12)
# p binary_search([1,2,4, 7, 12, 3], 14)
