RSpec.describe Leitor do
  subject { Leitor }

  context "Relacoes" do
    it "Deve pegar as relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [], :tem_um => [:Emprestimo] }
      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os 'metodos' e 'atributos'" do
      relacoes = { :atributos => [:nome, :email, :senha], :metodos => [:atualiza_cadastro] }
      expect(subject.busca_atributos).to eq(relacoes)
    end
  end
end
