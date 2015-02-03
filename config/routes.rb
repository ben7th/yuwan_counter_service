Rails.application.routes.draw do
  
  root 'home#index'

  resources :api do
    collection do
      post :chat_lines
    end
  end


end
