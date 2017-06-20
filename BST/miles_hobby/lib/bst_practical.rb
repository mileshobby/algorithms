require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  return k if tree_node.nil?
  #get maximum value
  right = kth_largest(tree_node.right, k)
  if right.is_a? Integer
    k = right
  else #if not integer, then we found the node
    return right
  end
  #if current node is the kth node, return it
  #otherwise, recur on left half
  k -= 1
  k == 0 ? tree_node : kth_largest(tree_node.left, k)

end
