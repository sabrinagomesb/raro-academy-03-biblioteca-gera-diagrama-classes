RSpec.describe User do
  subject {
    User
  }

  let (:dotfile) { File.open("spec/model_1.dot", "r") }

  it "Deve Gerar um arquivo em DOT" do
    subject.to_diagram()
    dotfile_gerado = File.open("outputs/model_1.dot", "r")

    expect(dotfile_gerado).to eq(dotfile)
  end
end
