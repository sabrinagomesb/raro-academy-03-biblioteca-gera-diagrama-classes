require "graphviz"

module Diagrama
  def para_diagrama(tipo)
    graph = GraphViz.new(:G, :type => :digraph)
    graph.node[:shape] = "record"
    graph.node[:fontname] = "Arial"
    graph.node[:fontsize] = 16
    graph.edge[:fontname] = "Arial"
    graph.edge[:fontsize] = 10

    classes = ObjectSpace.each_object(Class).select { |classe| classe.included_modules.include?(Diagrama) }

    classes.each do |classe_ref|
      nome = converte_classname(classe_ref)
      classe = Object.const_get(nome)

      label = "<{<b>#{nome}</b>"
      label_attrs = ""
      label_metodos = ""

      atributos = get_atributos(classe)

      atributos.each do |atributo|
        if atributo[:tipo] == "metodo"
          label_metodos += "#{atributo[:atributo]}()\n"
        else
          label_attrs += " #{atributo[:atributo]}\n"
        end
      end

      if label_attrs.size > 0
        label += "|"
        label += label_attrs
      end

      if label_metodos.size > 0
        label += "|"
        label += label_metodos
      end

      label += "}>"

      graph.add_node(nome, label: label, style: "filled", fillcolor: "lightgrey")

      classe.relacoes.each do |classe_relacionada, relacao|
        graph.add_edge(classe.to_s, classe_relacionada.to_s, label: relacao.sub("_", "\n"))
      end
    end

    graph.output(tipo.to_sym => "./outputs/model_1.#{tipo}")
  end

  # Metodos para capturar informações
  def get_classe_objeto(classename)
    Object.const_get(classename)
  end

  def converte_classname(classe)
    /<Class:(.*?)>/.match(classe.to_s)[1]
  end

  def get_atributos(classe)
    metodos = classe.instance_methods(false)
    atributos = []
    metodos.map do |metodo|
      propriedades = Hash.new { |h, k| h[k] = "" }
      attr_nome = metodo.to_s.sub("=", "")

      if metodo.to_s.include?("=")
        propriedades[:atributo] = attr_nome
        propriedades[:tipo] = "attr"
      else
        propriedades[:atributo] = metodo.to_s
        propriedades[:tipo] = "metodo"
      end

      atributos << propriedades unless propriedades.empty?
    end.uniq

    grupos = atributos.group_by { |h| h[:atributo] }
    unicos = grupos.select { |k, v| v.size == 1 }
    unicos.values.flatten + grupos.values.select { |v| v.size > 1 }.flatten.select { |h| h[:tipo] == "attr" }
  end
end
