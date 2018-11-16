class HomeController < ApplicationController
  
  before_action :authenticate_member!

  def index
    @dados_venda = Business.all
  end

  def vendedores
    @dados_vendedores = Business.select('distinct(seller_code), (seller_name)')
  end

  def detalhes
    
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
    
    @buscar = Business.where("date_service >= ? and date_service <= ?", params[:date_initial], params[:date_end])
    
    @vendedores_code = @buscar.distinct.pluck(:seller_code)

    @busca_total_vendas_sem_orcamento = @buscar.where.not(payment_type: "Orçamento").sum(:amount)
    @busca_total_vendas_de_orcamento = @buscar.where("payment_type = 'Orçamento'").sum(:amount)
    
    @buscar_sem_orcamento = @buscar.where.not(payment_type: "Orçamento")
    @buscar_de_orcamento = @buscar.where("payment_type = 'Orçamento'")

    @vendedor_tipo_orcamento = []
    @vendedores = []

    @vendedores_code.each do |code|
      vendedor_tipo_faturamento = Business.where(seller_code: code).last
      vendedor_tipo_faturamento.amount = seller_amount(vendedor_tipo_faturamento, @buscar_sem_orcamento)
      
      @vendedores << vendedor_tipo_faturamento if vendedor_tipo_faturamento
      
    end
    @vendedores = @vendedores.sort {|a, b | b.amount <=> a.amount}

    @vendedores_code.each do |code|
      vendedor_tipo_orcamento = Business.where(seller_code: code).last
      vendedor_tipo_orcamento.amount = seller_amount(vendedor_tipo_orcamento, @buscar_de_orcamento)

      @vendedor_tipo_orcamento << vendedor_tipo_orcamento if vendedor_tipo_orcamento
    end
    @vendedor_tipo_orcamento = @vendedor_tipo_orcamento.sort {|a, b | b.amount <=> a.amount}
    
  end 

end
