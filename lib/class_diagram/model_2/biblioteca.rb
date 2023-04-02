class Biblioteca
  attr_accessor :livros, :leitores, :emprestimos, :pagamentos

  def initialize
    @livros = []
    @leitores = []
    @emprestimos = []
    @pagamentos = []
  end

  def emprestimo(livro, leitor)
    if livro.disponivel?
      emprestimo = Emprestimo.new(livro, leitor)
      @emprestimos << emprestimo
      livro.emprestado = true
      return emprestimo
    else
      return "Livro indisponível no momento"
    end
  end

  def devolucao(emprestimo)
    emprestimo.livro.emprestado = false
    emprestimo.data_devolucao = Date.today
    valor_a_pagar = emprestimo.preco
    @pagamentos << valor_a_pagar
    @emprestimos.delete(emprestimo)
    return valor_a_pagar
  end
end