Rails.application.routes.draw do
  resources :customers
  root 'main#index'
end
