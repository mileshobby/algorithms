# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    #case 0: empty tree
    if @root.nil?
      @root = new_node
      return
    end
    node = @root
    #case 1: non-empty tree
    loop do
      if node.value < value
        if node.right.nil?
          node.right = new_node
          new_node.parent = node
          return
        else
          node = node.right
        end
      else
        if node.left.nil?
          node.left = new_node
          new_node.parent = node
          return
        else
          node = node.left
        end
      end
    end
  end

  def find(value, tree_node = @root)
    until tree_node == nil || tree_node.value == value
      if value > tree_node.value
        tree_node = tree_node.right
      else
        tree_node = tree_node.left
      end
    end
    tree_node.nil? ? nil : tree_node
  end

  def delete(value)
    deletion_node = self.find(value)
    #case 0: value doesn't exist
    raise "value could not be found in tree" if deletion_node == nil
    #case 1: no children
    if deletion_node == @root
      @root = nil
    elsif deletion_node.leaf_node?
      if deletion_node.right_child?
        deletion_node.parent.right = nil
      else
        deletion_node.parent.left = nil
      end
    #case 2: one child
    elsif deletion_node.left.nil?
      if deletion_node.right_child?
        deletion_node.parent.right = deletion_node.right
      else
        deletion_node.parent.left = deletion_node.right
      end
    elsif deletion_node.right.nil?
      if deletion_node.right_child?
        deletion_node.parent.right = deletion_node.right
      else
        deletion_node.parent.left = deletion_node.left
      end
    #case 3: two children. here we look for greatest node on left side
    else
      replacement_node = maximum(deletion_node.left)
      #case 3.1: max node is direct left child of deletion node
      unless replacement_node == deletion_node.left
        replacement_node.parent.right = replacement_node.left
        replacement_node.left = replacement_node.parent
        replacement_node.parent.parent = replacement_node
      end
      replacement_node.parent = deletion_node.parent
      replacement_node.right = deletion_node.right
      if deletion_node.right_child?
        deletion_node.parent.right = replacement_node
      else
        deletion_node.parent.left = replacement_node
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right.nil?
      tree_node = tree_node.right
    end
    tree_node
  end

  def depth(tree_node = @root)
    return 0 if tree_node == nil
    if tree_node.right == nil && tree_node.left == nil
      0
    elsif tree_node.right == nil
      1 + depth(tree_node.left)
    elsif tree_node.left == nil
      1 + depth(tree_node.right)
    else
      1 + [depth(tree_node.left), depth(tree_node.right)].max
    end
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil? || tree_node.leaf_node?
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1
    is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node == nil
    arr = in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
  end


  private
  # optional helper methods go here:

end
