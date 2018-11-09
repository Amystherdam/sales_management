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
    @vendedores_code = @buscar.distinct.pluck(:seller_code)
    # puts @vendedores
    #Variavel retorna a soma de vendas no período de @buscar
    @busca_total_vendas = @buscar.sum(:amount)
    
    @vendedores = []
    @vendedores_code.each do |code|
      vendedor = Business.where(seller_code: code).last
      vendedor.amount = seller_amount(vendedor, @buscar)
      @vendedores << vendedor if vendedor

    end
    @vendedores = @vendedores.sort {|a, b | b.amount <=> a.amount}

    # #Criação de um hash vazio
    # @receptor = {}
    # #Início de um laço de teste apartir de @vendedores
    # @vendedores.each_with_index do |val, index|
    #   #Hash com index = valores presentes na variavel @vendedor e cria chaves e valores.
 # percent_of(seller_amount(val, @buscar), @busca_total_vendas).round(2), "seller_amount" => seller_amount(val, @buscar)}    
    # end
    # puts "------------------------------Resultado------------------------------"
    # @receptor.each do |hash|
    #   puts hash[1]["percent"]
    # end
    # @receptor.length
    # puts "---------------------------------------------------------------------"







    #if @a<@b
     # puts "#{@a} Valor de A"
    #else
     # puts "#{@b} Valor de B"
    #end
   # if @receptor[index]["percent"] > @receptor[index + 1]["percent"]
    #  puts  "#{@receptor[index]["percent"]} Isso é a posição 0"
   # else
    #  puts  "#{@receptor[index + 1]["percent"]} Isso é a posição 1"
   # end
    
  end 

end
