require "graphviz"

module ToDiagram
  def to_diagram
    # Create a new graph
    g = GraphViz.new(:G, :type => :digraph)

    # Create two nodes
    hello = g.add_nodes("Hello")
    world = g.add_nodes("World")

    # Create an edge between the two nodes
    g.add_edges(hello, world)

    # Generate output ńg/dorfile
    g.output(:png => "./outputs/model_1.png")
    g.output(:dot => "./outputs/model_1.dot")
  end
end
