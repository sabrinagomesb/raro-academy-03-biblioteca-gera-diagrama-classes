class Venue
  extend Relacoes
  extend Diagrama

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
