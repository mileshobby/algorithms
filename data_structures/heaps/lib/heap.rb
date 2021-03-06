class MinHeap
  attr_reader :store

  def initialize
    @store = []
  end

  def length
    @store.length
  end

  def peek
    @store[0]
  end

  def to_s
    @store
  end

  def insert(val)
    @store << val
    heapify_up
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    min = @store.pop
    heapify_down
    min
  end

  def heapify_up
    index = @store.length - 1
    until index == 0 || @store[index] >= @store[parent(index)]
      @store[index], @store[parent(index)] = @store[parent(index)], @store[index]
      index = parent(index)
    end
  end

  def heapify_down
    index = 0
    until left_child(index) >= @store.length
      left = left_child(index)
      if right_child(index) < @store.length
        right = right_child(index)
        smaller = (@store[left] <= @store[right] ? left : right)
      else
        smaller = left
      end
      if @store[smaller] < @store[index]
        @store[smaller], @store[index] = @store[index], @store[smaller]
        index = smaller
      else
        break
      end
    end
  end

  private

  def left_child(index)
    index*2 + 1
  end

  def right_child(index)
    index*2 + 2
  end

  def parent(index)
    (index - 1)/2
  end

end

def kth_largest(arr, k)
  heap = MinHeap.new
  arr.each do |el|
    heap.insert(el)
    heap.extract if heap.length > k
  end
  heap.peek
end

ten = [4,3,6,1,2,10,9,5,7,8]
p kth_largest(ten, 4)
