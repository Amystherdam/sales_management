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

  def resultado
    @dados_venda = Business.all 
    @buscar = Business.where("date_service >= ? and date_service <= ?", params[:date_initial], params[:date_end])
    @vendedores = @buscar.select("distinct on (seller_code) *")
    @busca_total_vendas = @buscar.sum(:amount)
    @vendedores.each do |v|
      puts seller_amount(v, @buscar)
    end
  end 

end
