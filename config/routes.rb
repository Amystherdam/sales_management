Rails.application.routes.draw do

  get 'index', to: 'home#index'
  get 'vendedores', to: 'home#vendedores'
  get 'detalhes', to: 'home#detalhes'
  get 'buscarData', to: 'home#buscarData'
  get 'resultado', to: 'home#resultado'
  devise_for :members
  
  root 'home#index'
end
