RSpec.describe User do
  subject {
    User
  }

  let (:dotfile) { File.open("spec/model_1.dot", "r") }

  it "Deve Gerar um arquivo em DOT" do
    expect(subject.to_diagram()).to eq(dotfile)
  end
end
