module AtributosMetodos
  def cria_atributos
    self.class_variable_set(:@@atributos, {
      atributos: [],
      metodos: [],
    }) unless self.class_variable_defined?(:@@atributos)
  end

  def busca_atributos
    cria_atributos
    atributos = self.class_variable_get(:@@atributos)
    atributos[:metodos] = busca_metodos
    self.class_variable_set(:@@atributos, atributos)
    atributos
  end

  def busca_metodos
    atributos = self.class_variable_get(:@@atributos)
    metodos = []
    todos_atibutos = self.instance_methods(false)
    todos_atibutos.each do |metodo|
      if !(metodo.to_s.include?("="))
        metodos << metodo unless atributos[:atributos].include?(metodo)
      end
    end
    metodos
  end

  def adiiona_atributo(atributo)
    cria_atributos
    atributos = self.class_variable_get(:@@atributos)

    atributos[:atributos] << atributo unless atributos[:atributos].include?(atributo)
  end

  def attr_accessor(*args)
    args.each do |atributo|
      attr_reader atributo
      attr_writer atributo
    end
  end

  def attr_reader(*args)
    args.each do |atributo|
      adiiona_atributo(atributo)
      define_method(atributo) do
        instance_variable_get("@#{atributo}")
      end
    end
  end

  def attr_writer(*args)
    args.each do |atributo|
      adiiona_atributo(atributo)
      define_method("#{atributo}=") do |value|
        instance_variable_set("@#{atributo}", value)
      end
    end
  end
end
