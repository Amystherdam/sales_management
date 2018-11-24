class HomeController < ApplicationController
  
  before_action :authenticate_member!

  def index
    @dados_venda = Business.all
  end

  def vendedores
    @dados_vendedores = Business.select('distinct(seller_code), (seller_name)')
  end

  def detalhes
    @numero_servico = Business.where(service_number: params[:service_number])
    @buscar_numero_servico = @numero_servico.distinct.pluck(:service_number)
  end

  def busca_por_servico
    @buscar_por_servico = []

    @numero_servico = Business.where("service_number = ?", params[:service_number]).distinct.pluck(:service_number)

    @numero_servico.each do |num_serv|
      numero_servico = Business.where(service_number: num_serv).first
      numero_servico.amount = Business.where(service_number: num_serv).sum(:amount)

      @buscar_por_servico << numero_servico if numero_servico
    end
  end

  def buscar_por_estado
    @buscar_por_estado = []

    @estado = Business.where("business_situation = ?", params[:business_situation])
    @busca_estado_service_number = @estado.distinct.pluck(:service_number)

    @busca_estado_service_number.each do |serv_num|
      estado_negocio = Business.where(service_number: serv_num).first
      estado_negocio.amount = Business.where(service_number: serv_num).sum(:amount)

      @buscar_por_estado << estado_negocio if estado_negocio
    end
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
    
    @buscar_por_data = Business.where("date_service >= ? and date_service <= ?", params[:date_initial], params[:date_end])

    @buscar_numero_servico = @buscar_por_data.distinct.pluck(:service_number)
    @vendedores_code = @buscar_por_data.distinct.pluck(:seller_code)

    @busca_total_vendas_sem_orcamento = @buscar_por_data.where.not(payment_type: "Orçamento").sum(:amount)
    @busca_total_vendas_de_orcamento = @buscar_por_data.where("payment_type = 'Orçamento'").sum(:amount)
    
    @buscar_sem_orcamento = @buscar_por_data.where.not(payment_type: "Orçamento")
    @buscar_de_orcamento = @buscar_por_data.where("payment_type = 'Orçamento'")

    @vendas = []
    @vendedor_tipo_orcamento = []
    @vendedores = []

    @buscar_numero_servico.each do |num_serv|
      numero_servico = Business.where(service_number: num_serv).first
      numero_servico.amount = Business.where(service_number: num_serv).sum(:amount).round(2)

      @vendas << numero_servico if numero_servico
    end

    puts "--------------------------------------------------------------------------"
    puts @busca_total_vendas_de_orcamento
    @vendedores_code.each do |code|
      vendedor_tipo_faturamento = Business.where(seller_code: code).first
      vendedor_tipo_faturamento.amount = seller_amount(vendedor_tipo_faturamento, @buscar_sem_orcamento)
      vendedor_tipo_faturamento.product_value = percent_of(seller_amount(vendedor_tipo_faturamento, @buscar_sem_orcamento), @busca_total_vendas_sem_orcamento).round(2)

      

      @vendedores << vendedor_tipo_faturamento if vendedor_tipo_faturamento
      
    end
    @vendedores = @vendedores.sort {|a, b | b.amount <=> a.amount}

    @vendedores_code.each do |code|
      vendedor_tipo_orcamento = Business.where(seller_code: code).last
      vendedor_tipo_orcamento.amount = seller_amount(vendedor_tipo_orcamento, @buscar_de_orcamento)
      vendedor_tipo_orcamento.product_value = percent_of(seller_amount(vendedor_tipo_orcamento, @buscar_de_orcamento), @busca_total_vendas_de_orcamento).round(2)

      @vendedor_tipo_orcamento << vendedor_tipo_orcamento if vendedor_tipo_orcamento
    end
    @vendedor_tipo_orcamento = @vendedor_tipo_orcamento.sort {|a, b | b.amount <=> a.amount}

  end 

end
