require_relative 'graph'
require 'byebug'
#KAHN
# def topological_sort(vertices)
#   vertex_queue = vertices.select {|vertex| in_degree(vertex) == 0}
#   counts = {}
#   vertices.each do |vertex|
#     counts[vertex] = in_degree(vertex)
#   end
#   sorted = []
#   until vertex_queue.empty?
#     u = vertex_queue.shift
#     sorted << u
#     u.out_edges.each do |edge|
#       to_vertex = edge.to_vertex
#       counts[to_vertex] -= 1
#       vertex_queue << to_vertex if counts[to_vertex] == 0
#     end
#     vertices.delete(u)
#   end
#   vertices.empty? ? sorted : []
# end
#
# def in_degree(vertex)
#   vertex.in_edges.length
# end
# -------------------------
#TARJAN:
def topological_sort(vertices)
  visiting = []
  sorted = []
  cycle = {found: false}
  vertices.each do |vertex|
    next if sorted.include?(vertex)
    visit(vertex, visiting, sorted, cycle)
  end
  return [] if cycle[:found]
  sorted
end

def visit(vertex, visiting, sorted, cycle)
  visiting << vertex
  vertex.out_edges.each do |edge|
    if visiting.include?(edge.to_vertex)
      cycle[:found] = true
    else
      visit(edge.to_vertex, visiting, sorted, cycle) unless sorted.include?(edge.to_vertex)
    end
  end
  visiting.pop
  sorted.unshift(vertex)
end
