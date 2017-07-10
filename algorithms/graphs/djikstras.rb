require_relative 'graph'

#given a source vertex in a graph, find the shortest path from source to all vertices

#setup graph
a = Vertex.new(0)
b = Vertex.new(1)
c = Vertex.new(2)
d = Vertex.new(3)
e = Vertex.new(4)
f = Vertex.new(4)
g = Vertex.new(5)
h = Vertex.new(6)
i = Vertex.new(7)
j = Vertex.new(8)

Edge.new(a, b, 4)
Edge.new(a, i, 8)

Edge.new(b, i, 11)
Edge.new(b, c, 8)

Edge.new(c, b, 4)
Edge.new(c, i, 8)
Edge.new(c, i, 8)
Edge.new(c, i, 8)

Edge.new(a, b, 4)
Edge.new(a, i, 8)
Edge.new(a, b, 4)
Edge.new(a, i, 8)


def dijkstras

end
