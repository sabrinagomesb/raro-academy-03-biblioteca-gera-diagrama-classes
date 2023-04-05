class Livro
  extend Diagrama
  attr_accessor :nome, :autor, :ano, :emprestado

  def initialize(nome, autor, ano)
    @nome = nome
    @autor = autor
    @ano = ano
    @emprestado = false
  end

  def disponivel?
  end

  tem_um(:Emprestimo, :Autor)
end
