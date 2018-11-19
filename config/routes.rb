Rails.application.routes.draw do

  get 'index', to: 'home#index'
  get 'vendedores', to: 'home#vendedores'
  get 'detalhes/:service_number' => "home#detalhes", as: "detalhes"  
  get 'resultado' => "home#resultado", as: "resultado"  
  devise_for :members
  
  root 'home#index'
end
