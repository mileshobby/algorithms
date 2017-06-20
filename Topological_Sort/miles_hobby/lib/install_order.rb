# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative 'topological_sort'
require_relative 'graph'


def install_order(arr)
  #get max
  max = arr.flatten.max
  vertices = (1..max).to_a
  #create vertices
  vertices.map! { |num| Vertex.new(num) }
  #create edges
  arr.each do |dependency|
    Edge.new(vertices[dependency[1] - 1], vertices[dependency[0] - 1])
  end
  order = topological_sort(vertices)
  p  order.map { |vertex| vertex.value }

  order.map { |vertex| vertex.value }

end
