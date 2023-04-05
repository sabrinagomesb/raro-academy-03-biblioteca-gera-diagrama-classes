RSpec.describe Emprestimo do
  subject { Emprestimo }

  context "Relacoes" do
    it "Deve pegar as relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [], :tem_um => [:Faturamento] }
      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os 'metodos' e 'atributos'" do
      relacoes = { :atributos => [:livro, :leitor, :data_inicio, :data_fim], :metodos => [:preco] }
      expect(subject.busca_atributos).to eq(relacoes)
    end
  end
end
