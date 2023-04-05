require "graphviz"

require_relative "./relacoes.rb"
require_relative "./atributos_metodos"

module Diagrama
  include Relacoes
  include AtributosMetodos

  def cria_diagrama(tipo, filename)
    graph = GraphViz.new(:G, :type => :digraph)
    graph[:bgcolor] = "transparent"

    graph.node[:shape] = "record"
    graph.node[:fontname] = "Arial"
    graph.node[:fontsize] = "16"
    graph.edge[:fontname] = "Arial"
    graph.edge[:fontsize] = "10"

    cria_nos(graph)

    graph.output(tipo.to_sym => "./outputs/#{filename}.#{tipo}")
    graph
  end

  def cria_nos(graph)
    if graph.get_node(self.name) == nil
      adiciona_no(graph)

      if self.busca_relacoes[:tem_muitos].empty? && self.busca_relacoes[:tem_um].empty?
        return
      else
        cria_relacionamentos(graph)
      end
    end
  end

  def cria_relacionamentos(graph)
    relacoes = self.busca_relacoes
    tipos = relacoes.keys

    tipos.each do |tipo|
      relacoes[tipo].each do |relacao|
        classe_relacionada = Object.const_get(relacao.to_s)

        classe_relacionada.cria_nos(graph)
        graph.add_edge(self.name, relacao.name, label: tipo.to_s.sub("_", "\n").capitalize)
      end
    end
  end

  def adiciona_no(graph)
    classe_label = cria_label
    node = graph.add_nodes(self.name, :label => classe_label)
    node[:style] = "filled"
    node[:fillcolor] = "lightgrey"
  end

  private

  def cria_label
    label = "<{<b>#{self.name}</b>"
    atributos_label = ""
    metodos_label = ""

    atributos = self.busca_atributos
    atributos[:metodos].each do |metodo|
      metodos_label += "#{metodo.to_s}()<br/>"
    end
    atributos[:atributos].each do |atributo|
      atributos_label += "+#{atributo.to_s}<br/>"
    end

    if atributos_label.size > 0
      label += "|"
      label += atributos_label
    end

    if metodos_label.size > 0
      label += "|"
      label += metodos_label
    end

    label += "}>"
  end
end
