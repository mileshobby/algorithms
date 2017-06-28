require_relative "heap"

class Array
  def heap_sort!
    #heapify
    len = 2
    while(len <= self.length)
      BinaryMinHeap.heapify_up(self, len - 1, len)
      len += 1
    end
    #sort
    len = self.length
    while (len > 0)
      self[len-1], self[0] = self[0], self[len-1]
      len -= 1
      BinaryMinHeap.heapify_down(self, 0, len)
    end
    self.reverse!
  end
end
