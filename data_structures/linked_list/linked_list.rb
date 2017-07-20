class LinkedList
  attr_reader :length

  def initialize
    @head = Node.new
    @length = 0
  end

  def find(val)
    node = @head.next
    until node == nil || node.val == val
      node = node.next
    end
    node
  end

  def append(val)
    node = @head
    until node.next.nil?
      node = node.next
    end
    @length += 1
    node.next = Node.new(val)
  end

  def delete(val)
    node = @head.next
    until node.next.nil?
      if node.next.val == val
        node.next = node.next.next
      end
      node = node.next
    end
  end

  def to_s
    s = []
    node = @head.next
    until node.nil?
      s << node.val.to_s
      node = node.next
    end
    s = s.join(", ")
    "[" + s + "]"
  end

private

  class Node
    attr_accessor :val, :next

    def initialize(val = nil)
      @val = val
      @next = nil
    end
  end

end


x = LinkedList.new
x.append(1)
x.append(2)
x.append(3)
x.append(4)
x.delete(3)
puts x
