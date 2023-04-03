# 'module Relacionamento'
module Relacionamento
  def tem_muitos(lista_classes)
    muitos = []
    lista_classes.each { |classe| muitos << classe }
    muitos
  end

  def tem_um(lista_classes)
    um = []
    lista_classes.each { |classe| um << classe }
    um
  end
end
