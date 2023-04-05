RSpec.describe Faturamento do
  subject { Faturamento }

  context "Relacoes" do
    it "Deve pegar as relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [:Emprestimo], :tem_um => [] }
      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os 'metodos' e 'atributos'" do
      relacoes = { :atributos => [:total, :pagamentos], :metodos => [:adiciona_pagamento] }
      expect(subject.busca_atributos).to eq(relacoes)
    end
  end
end
