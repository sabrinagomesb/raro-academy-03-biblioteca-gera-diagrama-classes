class User
  extend Relacoes
  extend Diagrama

  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def atualiza_senha(password)
    @password = password
  end

  para_muitos :Order
  para_um :Venue
end
