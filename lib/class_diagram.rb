# frozen_string_literal: true
require "byebug"
require "rspec"
require "ruby-graphviz"

require_relative "class_diagram/version"

require_relative "class_diagram/modules/diagrama.rb"
require_relative "class_diagram/modules/relacoes.rb"
require_relative "class_diagram/modules/atributos_metodos.rb"

# Modelo de exemplo
require_relative "class_diagram/model/autor.rb"
require_relative "class_diagram/model/biblioteca.rb"
require_relative "class_diagram/model/emprestimo.rb"
require_relative "class_diagram/model/faturamento.rb"
require_relative "class_diagram/model/leitor.rb"
require_relative "class_diagram/model/livro.rb"

module ClassDiagram
  class Error < StandardError; end

  # Your code goes here...
end
