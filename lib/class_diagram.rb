# frozen_string_literal: true

require "rspec"
require "ruby-graphviz"

require_relative "class_diagram/version"
require_relative "class_diagram/diagrama/diagrama.rb"
require_relative "class_diagram/diagrama/relacoes.rb"

# Modelo de exemplo 1
require_relative "class_diagram/model_1/order.rb"
require_relative "class_diagram/model_1/user.rb"
require_relative "class_diagram/model_1/venue.rb"

# Modelo de exemplo 2
require_relative "class_diagram/model_2/autor.rb"
require_relative "class_diagram/model_2/biblioteca.rb"
require_relative "class_diagram/model_2/emprestimo.rb"
require_relative "class_diagram/model_2/leitor.rb"
require_relative "class_diagram/model_2/livro.rb"

module ClassDiagram
  class Error < StandardError; end

  # Your code goes here...
end
