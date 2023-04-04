RSpec.describe User do
  subject { User }

  describe "Modulo Relacionamento" do
    it "Deve ter uma relacao de para muitos" do
      expect(subject.relacoes.key?(:Order)).to eq(true)
    end

    it "Deve ter uma relacao de para um" do
      expect(subject.relacoes.key?(:Venue)).to eq(true)
    end

    it "Deve armazenar as relacoes" do
      relacoes = { :Order => "para_muitos", :Venue => "para_um" }
      expect(subject.relacoes).to eq(relacoes)
    end
  end

  describe "Módulo Diagrama" do
    it "Deve Gerar um arquivo em DOT" do
      subject.para_diagrama("dot")
      path = "outputs/model_1.dot"
      dotfile_gerado = File.open(path, "r")

      expect(!dotfile_gerado).to eq(false)
      expect(File.zero?(path)).to eq(false)
    end

    it "Deve Gerar um arquivo em PNG" do
      subject.para_diagrama("png")
      path = "outputs/model_1.png"
      png_gerado = File.open(path, "r")

      expect(!png_gerado).to eq(false)
      expect(File.empty?(path)).to eq(false)
    end

    it "Deve instanciar uma classe de User" do
      user = User.new("email", "password")

      expect(user.email).to eq("email")
      expect(user.password).to eq("password")
    end
  end
end
