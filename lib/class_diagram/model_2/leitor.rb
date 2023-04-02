class Leitor
  attr_accessor :nome, :email, :nasc

  def initialize(nome, email, nasc)
    @nome = nome
    @email = email
    @nasc = nasc
  end

  def atualiza_cadastro(nome, email, nasc)
    @nome = nome
    @email = email
    @nasc = nasc
  end
end
