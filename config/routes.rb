Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/rubymyadmin', as: 'rails_admin'
  root 'home#index'

  resources :api do
    collection do
      post :chat_lines
      post :room_status
    end
  end


end
