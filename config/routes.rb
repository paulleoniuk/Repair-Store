Rails.application.routes.draw do
  root 'main#index'

  resources :customers do
    collection do
      get :search
    end
  end


end
