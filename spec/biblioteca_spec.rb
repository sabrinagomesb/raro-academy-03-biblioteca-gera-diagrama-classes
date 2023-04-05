RSpec.describe Biblioteca do
  subject { Biblioteca }

  context "Relacoes" do
    it "Deve pegar as relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [:Livro, :Leitor, :Emprestimo], :tem_um => [:Faturamento] }

      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os 'metodos' e 'atributos'" do
      relacoes = { :atributos => [:livros, :leitores, :emprestimos, :pagamentos, :faturamento], :metodos => [:emprestimo, :devolucao, :disponiveis?] }

      expect(subject.busca_atributos).to eq(relacoes)
    end
  end
end
