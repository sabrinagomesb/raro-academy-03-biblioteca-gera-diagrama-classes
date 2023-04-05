RSpec.describe Diagrama do
  subject { Biblioteca }

  context "Diagrama" do
    it "Deve criar um gráfico" do
      expect(subject.cria_diagrama("png", "diagrama")).to be_a(GraphViz)
    end

    it "Deve Gerar um arquivo em DOT" do
      subject.cria_diagrama("dot", "diagrama")

      path = "outputs/diagrama.dot"
      dotfile_gerado = File.open(path, "r")

      expect(!dotfile_gerado).to eq(false)
      expect(File.zero?(path)).to eq(false)
    end

    it "Deve Gerar um arquivo em PNG" do
      subject.cria_diagrama("png", "diagrama")

      path = "outputs/diagrama.png"
      png_gerado = File.open(path, "r")

      expect(!png_gerado).to eq(false)
      expect(File.empty?(path)).to eq(false)
    end

    it "Deve Gerar um arquivo em SVG" do
      subject.cria_diagrama("svg", "diagrama")

      path = "outputs/diagrama.svg"
      png_gerado = File.open(path, "r")

      expect(!png_gerado).to eq(false)
      expect(File.empty?(path)).to eq(false)
    end

    it "Deve Gerar um arquivo em JPG" do
      subject.cria_diagrama("jpg", "diagrama")

      path = "outputs/diagrama.jpg"
      png_gerado = File.open(path, "r")

      expect(!png_gerado).to eq(false)
      expect(File.empty?(path)).to eq(false)
    end
  end

  context "Relacoes" do
    before(:each) do
      subject.class_variable_set("@@relacoes", {})
    end

    it "Deve criar relacoes 'tem muitos'" do
      relacoes = { :tem_muitos => [:Livro, :Leitor, :Emprestimo] }

      expect(subject.tem_muitos(:Livro, :Leitor, :Emprestimo)).to eq(relacoes)
    end

    it "Deve criar relacoes 'tem um'" do
      relacoes = { :tem_um => [:Faturamento] }

      expect(subject.tem_um(:Faturamento)).to eq(relacoes)
    end

    it "Deve criar relacoes 'tem muitos' e 'tem um'" do
      relacoes = { :tem_muitos => [:Livro, :Leitor, :Emprestimo], :tem_um => [:Faturamento] }

      subject.tem_muitos(:Livro, :Leitor, :Emprestimo)
      subject.tem_um(:Faturamento)

      expect(subject.busca_relacoes).to eq(relacoes)
    end
  end

  context "Atributos e metodos" do
    it "Deve pegar os metodos da classe" do
      expect(subject.busca_atributos[:metodos].include?(:devolucao)).to eq(true)
      expect(subject.busca_atributos[:metodos].include?(:disponiveis?)).to eq(true)
      expect(subject.busca_atributos[:metodos].include?(:emprestimo)).to eq(true)
    end

    it "Deve pegar os atributos da classe" do
      expect(subject.busca_atributos[:atributos].include?(:livros)).to eq(true)
      expect(subject.busca_atributos[:atributos].include?(:leitores)).to eq(true)
      expect(subject.busca_atributos[:atributos].include?(:emprestimos)).to eq(true)
      expect(subject.busca_atributos[:atributos].include?(:faturamento)).to eq(true)
      expect(subject.busca_atributos[:atributos].include?(:pagamentos)).to eq(true)
    end
  end
end
