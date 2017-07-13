def mergesort(arr, &prc)
  return arr if arr.length <= 1
  prc ||= Proc.new {|a, b| a <=> b}
  mid = (arr.length - 1) / 2
  left = mergesort(arr[0..mid])
  right = mergesort(arr[mid + 1..-1])

  merge(left, right, &prc)

end

def merge(arr1, arr2, &prc)
  sorted = []
  until(arr1.empty? || arr2.empty?)
    sorted << (prc.call(arr1.first, arr2.first) < 1 ? arr1.shift : arr2.shift)
  end
  sorted + arr1 + arr2
end

p mergesort([5,4,5,7,3,4,8,10,3])
