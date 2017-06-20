class BSTNode
  attr_accessor :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end

  def leaf_node?
    self.left.nil? && self.right.nil?
  end

  def right_child?
    self.parent.value < self.value
  end
end
