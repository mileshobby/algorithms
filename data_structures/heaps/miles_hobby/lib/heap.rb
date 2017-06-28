require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc ||= Proc.new { |a, b| a <=> b}
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[-1], store[0] = store[0], store[-1]
    popVal = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, @store.length, &@prc)
    popVal
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length - 1, @store.length, &@prc)
  end

  public

  def self.child_indices(len, parent_idx)
    [2 * parent_idx + 1, 2 * parent_idx + 2].select{ |idx| idx < len}
  end

  def self.parent_index(child_idx)
    raise "root has no parent" if child_idx == 0
    (child_idx - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b}
    children_i = child_indices(len, parent_idx)
    until children_i.empty? ||
          children_i.all? {|child_idx| prc.call(array[parent_idx], array[child_idx]) < 1}
      if children_i.length == 1
        array[parent_idx], array[children_i[0]] = array[children_i[0]], array[parent_idx]
      else
        swap_idx = prc.call(array[children_i[0]], array[children_i[1]]) < 1 ?
                    children_i[0] : children_i[1]
        array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]
        parent_idx = swap_idx
        children_i = child_indices(len, parent_idx)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new { |a, b| a <=> b}
    parent_idx = parent_index(child_idx)
    until prc.call(array[child_idx], array[parent_idx]) > -1
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      return array if parent_idx == 0
      temp = parent_idx
      parent_idx = parent_index(parent_idx)
      child_idx = temp
    end
    array
  end
end
