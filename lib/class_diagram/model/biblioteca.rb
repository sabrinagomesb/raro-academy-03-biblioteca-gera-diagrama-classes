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

  def disponiveis?
  end

  tem_muitos(:Livro, :Leitor, :Emprestimo)
  tem_um(:Faturamento)
end
