RSpec.describe User do
  subject { User }

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
  end

  describe "Modulo Relacionamento" do
    it "Deve criar um relacionamento de 'muitos para'" do
      array_tipo_muitos = subject.tem_muitos([Order, Venue])

      expect(array_tipo_muitos.include?(Order)).to eq(true)
    end
    it "Deve criar um relacionamento de 'um para'" do
      array_tipo_um = subject.tem_um([Venue])

      expect(array_tipo_um.include?(Venue)).to eq(true)
    end
  end
end
