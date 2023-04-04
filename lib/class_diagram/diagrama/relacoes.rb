module Relacoes
  def para_muitos(classe)
    @relacoes ||= {}
    @relacoes[classe] = "para_muitos"
  end

  def para_um(classe)
    @relacoes ||= {}
    @relacoes[classe] = "para_um"
  end

  def relacoes
    @relacoes ||= {}
  end
end
