class Faturamento
  extend Diagrama

  attr_accessor :total, :pagamentos

  def initialize
    @total = 0
    @pagamentos = []
  end

  def adiciona_pagamento(pagamento)
  end

  tem_muitos(:Emprestimo)
end
