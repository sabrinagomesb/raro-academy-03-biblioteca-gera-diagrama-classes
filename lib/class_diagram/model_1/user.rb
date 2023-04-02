class User
  extend ToDiagram
  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end
end
