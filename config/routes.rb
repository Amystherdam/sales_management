Rails.application.routes.draw do

  get 'index', to: 'home#index'
  get 'vendedores', to: 'home#vendedores'

  devise_for :members
  
  root 'home#index'
end
