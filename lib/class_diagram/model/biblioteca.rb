class Biblioteca
  extend Diagrama

  attr_accessor :livros, :leitores, :emprestimos, :pagamentos
  attr_reader :faturamento

  def initialize
    @livros = []
    @leitores = []
    @emprestimos = []
    @pagamentos = []
  end

  def emprestimo(livro, leitor)
  end

  def devolucao(emprestimo)
  end
end
