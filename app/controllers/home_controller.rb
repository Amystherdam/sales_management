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

  def resultado
    @buscar = Business.where("date_service >= ? and date_service <= ?", "2018-10-01", "2018-10-10")
    @dados_venda = Business.all 
  end
end
