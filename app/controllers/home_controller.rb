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

  #Método trás soma das vendas que um vendedor fez
  def seller_amount(vendedor, buscar)
    buscar.where(seller_code: vendedor.seller_code).sum(:amount)
  end

  #Método trás a pocentagem que cada vendedor tem sobre o total de vendas
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
    #Criação de um hash vazio
    @receptor = {}
    #Início de um laço de teste apartir de @vendedores
    @vendedores.each_with_index do |val, index|
      #Hash com index = valores presentes na variavel @vendedor e cria chaves e valores.
      @receptor[index] = {"id" => val.seller_code, "name" => val.seller_name, "percent" => percent_of(seller_amount(val, @buscar), @busca_total_vendas).round(2), "seller_amount" => seller_amount(val, @buscar)}    
      @a = @receptor[index]["percent"]
      @b = @a
       
    end
    if @a>@b
      puts @a
    else
      puts @b
    end
    
  end 

end
