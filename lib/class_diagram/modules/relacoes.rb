module Relacoes
  def cria_relacoes
    unless self.class_variable_defined?(:@@relacoes)
      self.class_variable_set(:@@relacoes, {
        tem_muitos: [],
        tem_um: [],
      })
    end
  end

  def busca_relacoes
    cria_relacoes
    self.class_variable_get(:@@relacoes)
  end

  def tem_muitos(*args)
    cria_relacoes
    relacoes = self.class_variable_get(:@@relacoes)

    relacoes[:tem_muitos] = args
    self.class_variable_set(:@@relacoes, relacoes)
  end

  def tem_um(*args)
    cria_relacoes
    relacoes = self.class_variable_get(:@@relacoes)

    relacoes[:tem_um] = args
    self.class_variable_set(:@@relacoes, relacoes)
  end
end
