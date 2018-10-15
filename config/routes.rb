Rails.application.routes.draw do
  devise_for :members
  get 'home/index'
  get 'home/vendedores'
  
  root 'home#index'
end
