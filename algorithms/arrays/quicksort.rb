class Array

  def quicksort
    return self if self.length <= 1
    pivot = rand(self.length)
    self[pivot], self[0] = self[0], self[pivot]
    pivot = self[0]
    left = self[1..-1].select {|el| el < pivot }
    right = self[1..-1].select {|el| el >= pivot }
    left.quicksort + [pivot] + right.quicksort
  end

end

p [1,5,3,7,4,10,12,9,3].quicksort
