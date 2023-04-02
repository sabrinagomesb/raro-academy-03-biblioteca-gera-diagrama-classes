RSpec.describe User do
  subject {
    User
  }

  let (:dotfile) { File.open("model_1.dot") }

  it "Deve Gerar um arquivo em DOT" do
    expect(subject.to_diagram()).to be_a(dotfile)
  end
end
