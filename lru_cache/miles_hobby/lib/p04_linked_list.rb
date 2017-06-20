require 'byebug'
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    count == 0 ? nil : @head.next
  end

  def last
    count == 0 ? nil : @tail.prev
  end

  def empty?
    @count == 0
  end

  def get(key)
    node = @head.next
    until node == @tail
      return node.val if node.key == key
      node = node.next
    end
    nil
  end

  def include?(key)
    node = @head
    until node == @tail
      node = node.next
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev.next = new_node
    @tail.prev = new_node
    @count += 1
  end

  def update(key, val)
    node = @head
    until node == @tail
      node = node.next
      return node.val = val if node.key == key
    end
    nil
  end

  def remove(key)
    node = @head
    until node == @tail
      node = node.next
      return node.remove if node.key == key
    end
    nil
  end

  def each
    node = @head.next
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
