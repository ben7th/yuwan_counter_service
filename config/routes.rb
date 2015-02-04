Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/rubymyadmin', as: 'rails_admin'
  root 'home#index'

  resources :api do
    collection do
      post :chat_lines
    end
  end


end
