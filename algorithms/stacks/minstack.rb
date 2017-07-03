class MinStack

  def initialize
    @val_stack = []
    @min_stack = []
  end

  def push(val)
    @val_stack.push(val)
    curr_min = @min_stack[-1] || 1.0/0
    @min_stack.push([val, curr_min].min)
  end

  def pop
    @min_stack.pop
    @val_stack.pop
  end

  def min
    @min_stack[-1]
  end

end


m = MinStack.new
m.push(7);
m.push(3);
m.push(5);
m.push(1);
p m.min
m.pop
p m.min
m.pop
p m.min
m.pop
p m.min
