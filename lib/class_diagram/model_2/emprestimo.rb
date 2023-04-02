class Emprestimo
  attr_accessor :data_inicio, :data_fim, :livro, :leitor, :data_devolucao

  def initialize(livro, leitor)
    @livro = livro
    @leitor = leitor
  end

  def preco
  end
end
