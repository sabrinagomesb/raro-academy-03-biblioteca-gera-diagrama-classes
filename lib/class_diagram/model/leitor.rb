class Leitor
  extend Diagrama

  attr_accessor :nome, :email, :senha

  def initialize(nome, email, senha)
    @nome = nome
    @email = email
    @senha = senha
  end

  def atualiza_cadastro(nome, email, senha)
    @nome = nome
    @email = email
    @senha = senha
  end
end
