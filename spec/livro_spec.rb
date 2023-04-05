RSpec.describe Livro do
  subject { Livro }

  context "Relacoes" do
    it "Deve pegar as relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [], :tem_um => [:Emprestimo, :Autor] }
      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os 'metodos' e 'atributos'" do
      relacoes = { :atributos => [:nome, :autor, :ano, :emprestado], :metodos => [:disponivel?] }
      expect(subject.busca_atributos).to eq(relacoes)
    end
  end
end
