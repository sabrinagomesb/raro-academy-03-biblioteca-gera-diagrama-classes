class Emprestimo
  extend Diagrama

  attr_accessor :data_inicio, :data_fim, :livro, :leitor

  def initialize(, livro, leitor, data_inicio, data_fim)
    @livro = livro
    @leitor = leitor
    @data_inicio = data_inicio
    @data_fim = data_fim
  end

  def preco
  end
end
