class Emprestimo
  extend Diagrama

  attr_accessor :livro, :leitor, :data_inicio, :data_fim

  def initialize(livro, leitor, data_inicio, data_fim)
    @livro = livro
    @leitor = leitor
    @data_inicio = data_inicio
    @data_fim = data_fim
  end

  def preco
  end

  tem_um(:Faturamento)
end
