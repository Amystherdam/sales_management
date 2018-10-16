class HomeController < ApplicationController
  
  before_action :authenticate_member!

  def index
  end

  def vendedores
  end
end
