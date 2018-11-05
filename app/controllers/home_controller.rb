class HomeController < ApplicationController
  
  before_action :authenticate_member!

  def index
    @dados_venda = Business.all
  end

  def vendedores
    @dados_vendedores = Business.all
  end

  def detalhes
  end

  def buscarData
  end

  def seller_amount(vendedor, buscar)
    buscar.where(seller_code: vendedor.seller_code).sum(:amount)
  end

  def percent_of(vendas_vendedor, total_vendas)
    vendas_vendedor.to_f / total_vendas.to_f * 100.0
  end

  def resultado
    #Variavel herda tudo do model Business
    @dados_venda = Business.all 
    #Variavel recebe consulta onde date_service seja igual aos valores de params(view)
    @buscar = Business.where("date_service >= ? and date_service <= ?", params[:date_initial], params[:date_end])
    #Variavel recebe os vendedores do período de @buscar sem repetição para poder rankear
    @vendedores = @buscar.select("distinct on (seller_code) *")
    #Variavel retorna a soma de vendas no período de @buscar
    @busca_total_vendas = @buscar.sum(:amount)
    #Criação de um array vazio
    @receptor_ordenador = []
    #Início de um laço de teste apartir de @vendedores
    @vendedores.each do |v|
      #Array recebe método que retorna o percentual com base em variaveis e duas casas decimais
      @receptor_ordenador << percent_of(seller_amount(v, @buscar), @busca_total_vendas).round(2)
      #Impressão de teste
      puts seller_amount(v, @buscar)
      #Impressão de teste
      puts percent_of(seller_amount(v, @buscar), @busca_total_vendas).round(2)
    end
    #Variavel recebe array e o ordena
    @ordenador = @receptor_ordenador.sort {|x,y| y <=> x }

  end 

end
