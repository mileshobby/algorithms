class MaxIntSet
  attr_reader :count

  def initialize(max)
    @store = Array.new(max, false)
    @count = 0
  end

  def insert(num)
    raise 'Out of bounds' unless self.is_valid?(num)
    @count += 1
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' unless self.is_valid?(num)
    @count -= 1
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  protected

  def is_valid?(num)
    num.between?(0, @store.length)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % (@store.length - 1)].push(num)
  end

  def remove(num)
    @store[num % (@store.length - 1)].delete(num)
  end

  def include?(num)
    @store[num % (@store.length - 1)].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.length
    @store[num % (@store.length - 1)].push(num)
    @count += 1
  end

  def remove(num)
    @store[num % (@store.length - 1)].delete(num)
    @count -= 1
  end

  def include?(num)
    @store[num % (@store.length - 1)].include?(num)
  end

  protected

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) { Array.new }
    num_buckets = new_store.length
    @store.each do |bucket|
      bucket.each do |num|
        new_store[ num % (num_buckets - 1)].push(num)
      end
    end
    @store = new_store
  end
end
